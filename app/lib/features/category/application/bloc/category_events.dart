part of 'category_bloc.dart';

abstract class CategoryEvent {}

class GetCategoriesEvent extends CategoryEvent {}

class AddCategoryEvent extends CategoryEvent {
  final CategoryModel category;

  AddCategoryEvent(this.category);
}

class DeleteCategoryEvent extends CategoryEvent {
  final int categoryId;

  DeleteCategoryEvent(this.categoryId);
}

class UpdateCategoryEvent extends CategoryEvent {
  final CategoryModel category;

  UpdateCategoryEvent(this.category);
}