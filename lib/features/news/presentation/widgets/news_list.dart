import 'package:flutter/material.dart';
import '../../domain/models/news_article.dart';
import 'news_list_tile.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticle> articles;
  final Function(NewsArticle)? onBookmarkPressed;
  final Function(NewsArticle)? onSharePressed;

  const NewsList({
    super.key,
    required this.articles,
    this.onBookmarkPressed,
    this.onSharePressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: articles.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final article = articles[index];
        return NewsListTile(
          article: article,
          onBookmarkPressed: onBookmarkPressed != null
              ? () => onBookmarkPressed!(article)
              : null,
          onSharePressed:
              onSharePressed != null ? () => onSharePressed!(article) : null,
        );
      },
    );
  }
}
