import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/news_article.dart';

// Events
abstract class BookmarkEvent {}

class AddBookmark extends BookmarkEvent {
  final NewsArticle article;
  AddBookmark(this.article);
}

class RemoveBookmark extends BookmarkEvent {
  final String articleId;
  RemoveBookmark(this.articleId);
}

class LoadBookmarks extends BookmarkEvent {}

// State
class BookmarkState {
  final List<NewsArticle> bookmarkedArticles;
  final Set<String> bookmarkedIds;

  const BookmarkState({
    required this.bookmarkedArticles,
    required this.bookmarkedIds,
  });

  BookmarkState copyWith({
    List<NewsArticle>? bookmarkedArticles,
    Set<String>? bookmarkedIds,
  }) {
    return BookmarkState(
      bookmarkedArticles: bookmarkedArticles ?? this.bookmarkedArticles,
      bookmarkedIds: bookmarkedIds ?? this.bookmarkedIds,
    );
  }
}

// BLoC
class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  static const String _prefsKey = 'bookmarked_articles';

  BookmarkBloc()
      : super(const BookmarkState(bookmarkedArticles: [], bookmarkedIds: {})) {
    on<LoadBookmarks>(_onLoadBookmarks);
    on<AddBookmark>(_onAddBookmark);
    on<RemoveBookmark>(_onRemoveBookmark);
  }

  Future<void> _onLoadBookmarks(
      LoadBookmarks event, Emitter<BookmarkState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(_prefsKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final articles =
          jsonList.map((json) => NewsArticle.fromJson(json)).toList();
      final ids = articles.map((article) => article.id).toSet();
      emit(BookmarkState(bookmarkedArticles: articles, bookmarkedIds: ids));
    }
  }

  Future<void> _onAddBookmark(
      AddBookmark event, Emitter<BookmarkState> emit) async {
    final updatedArticles = [...state.bookmarkedArticles, event.article];
    final updatedIds = {...state.bookmarkedIds, event.article.id};

    await _saveBookmarks(updatedArticles);
    emit(BookmarkState(
        bookmarkedArticles: updatedArticles, bookmarkedIds: updatedIds));
  }

  Future<void> _onRemoveBookmark(
      RemoveBookmark event, Emitter<BookmarkState> emit) async {
    final updatedArticles = state.bookmarkedArticles
        .where((article) => article.id != event.articleId)
        .toList();
    final updatedIds = state.bookmarkedIds.difference({event.articleId});

    await _saveBookmarks(updatedArticles);
    emit(BookmarkState(
        bookmarkedArticles: updatedArticles, bookmarkedIds: updatedIds));
  }

  Future<void> _saveBookmarks(List<NewsArticle> articles) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = articles.map((article) => article.toJson()).toList();
    await prefs.setString(_prefsKey, jsonEncode(jsonList));
  }
}
