import 'package:app/features/category/domain/entities/category.dart';
import 'package:app/features/category/infrastructure/datamodels/category_model.dart';

class CategoryValidator {
  static String? validateTitle(String? value, List<Category> categories) {
    if (value == null || value.trim().isEmpty) {
      return 'Пожалуйста, введите название категории';
    }
    if (value.length > CategoryModel.maxTitleLength) {
      return 'Название категории не должно превышать ${CategoryModel.maxTitleLength} символов';
    }
    if (categories.any((category) => category.title == value.trim())) {
      return 'Категория с таким названием уже существует';
    }
    return null;
  }
}