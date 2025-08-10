import 'package:app/features/category/domain/entities/category.dart';
import 'package:app/features/spend/infrastructure/datamodels/spend_model.dart';
import 'package:app/generated/l10n.dart';

class SpendValidator {
  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.current.spendTitleEmpty;
    }
    if (value.length > SpendModel.maxTitleLength) {
      return S.current.spendTitleTooLong(SpendModel.maxTitleLength);
    }
    return null;
  }

  static String? validateAmount(String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.current.spendAmountEmpty;
    }
    if (double.tryParse(value) == null) {
      return S.current.spendAmountNotNumber;
    }
    if (double.parse(value) <= 0) {
      return S.current.spendAmountGreaterThanZero;
    }
    if (double.parse(value) > SpendModel.maxAmount) {
      return S.current.spendAmountTooLarge(SpendModel.maxAmount);
    }
    return null;
  }

  static String? validateCategory(Category? category) {
    if (category == null) {
      return S.current.spendCategoryRequired;
    }
    return null;
  }
}