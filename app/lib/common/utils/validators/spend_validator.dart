import 'package:app/features/category/domain/entities/category.dart';
import 'package:app/features/spend/infrastructure/datamodels/spend_model.dart';

class SpendValidator {
  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Название расхода не может быть пустым';
    }
    if (value.length > SpendModel.maxTitleLength) {
      return 'Название расхода не должно превышать ${SpendModel.maxTitleLength} символов';
    }
    return null;
  }

  static String? validateAmount(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Пожалуйста, введите сумму расхода';
    }
    if (double.tryParse(value) == null) {
      return 'Сумма расхода должна быть числом';
    }
    if (double.parse(value) <= 0) {
      return 'Сумма расхода должна быть больше 0';
    }
    if (double.parse(value) > SpendModel.maxAmount) {
      return 'Сумма расхода не должна превышать ${SpendModel.maxAmount}';
    }
    return null;
  }

  static String? validateCategory(Category? category) {
    if (category == null) {
      return 'Пожалуйста, выберите категорию расхода';
    }
    return null;
  }
}