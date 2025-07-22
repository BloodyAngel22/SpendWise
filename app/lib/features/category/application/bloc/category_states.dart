part of 'category_bloc.dart';

abstract class CategoryState {} 

class CategoryInitialState extends CategoryState {}

class CategoriesLoadedState extends CategoryState {
  final List<Category> categories;
  CategoriesLoadedState(this.categories);
}

class CategoryLoadingState extends CategoryState {}

class CategoryErrorState extends CategoryState {
  final String message;
  CategoryErrorState(this.message);
}

class CategoryDeletedState extends CategoryState {}

class CategoryUpdatedState extends CategoryState {}