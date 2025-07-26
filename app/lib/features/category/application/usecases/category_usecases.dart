import 'package:app/features/category/domain/entities/category.dart';
import 'package:app/features/category/domain/irepositories/i_category_repository.dart';
import 'package:app/features/category/infrastructure/datamodels/category_model.dart';

class CategoryUsecases {
  final ICategoryRepository categoryRepository;

  CategoryUsecases(this.categoryRepository);

  Future<void> addCategory(CategoryModel category) async {
    await categoryRepository.addCategory(category);
  }

  Future<void> updateCategory(CategoryModel category) async {
    await categoryRepository.updateCategory(category);
  }

  Future<void> deleteCategory(int categoryId) async {
    await categoryRepository.deleteCategory(categoryId);
  }

  Future<List<Category>> getCategories([String? query]) async {
    var categories = await categoryRepository.getCategories();

    if (query?.isNotEmpty == true) {
      categories = categories
          .where(
            (category) =>
                category.title.toLowerCase().contains(query!.toLowerCase()),
          )
          .toList();
    }

    return categories;
  }
}
