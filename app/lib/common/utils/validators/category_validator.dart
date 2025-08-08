import 'package:app/features/category/domain/entities/category.dart';
import 'package:app/features/category/infrastructure/datamodels/category_model.dart';
import 'package:app/generated/l10n.dart';

class CategoryValidator {
  static String? validateTitle(String? value, List<Category> categories) {
    if (value == null || value.trim().isEmpty) {
      return S.current.categoryTitleEmpty;
    }
    if (value.length > CategoryModel.maxTitleLength) {
      return S.current.categoryTitleTooLong(CategoryModel.maxTitleLength);
    }
    if (categories.any((category) => category.title == value.trim())) {
      return S.current.categoryTitleExists;
    }
    return null;
  }
}