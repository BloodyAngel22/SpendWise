import 'package:app/features/category/domain/entities/category.dart';
import 'package:app/features/category/infrastructure/datamodels/category_model.dart';

abstract class ICategoryRepository {
  Future<List<Category>> getCategories();
  Future<Category> getCategory(int categoryId);
  Future<void> addCategory(CategoryModel category);
  Future<void> updateCategory(CategoryModel category);
  Future<void> deleteCategory(int categoryId);
}