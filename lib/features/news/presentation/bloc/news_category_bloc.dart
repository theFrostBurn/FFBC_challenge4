import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class NewsCategoryEvent {}

class CategorySelected extends NewsCategoryEvent {
  final String category;
  CategorySelected(this.category);
}

// States
class NewsCategoryState {
  final String selectedCategory;

  NewsCategoryState({
    required this.selectedCategory,
  });
}

class NewsCategoryBloc extends Bloc<NewsCategoryEvent, NewsCategoryState> {
  NewsCategoryBloc() : super(NewsCategoryState(selectedCategory: '정치')) {
    on<CategorySelected>((event, emit) {
      emit(NewsCategoryState(selectedCategory: event.category));
    });
  }
}
