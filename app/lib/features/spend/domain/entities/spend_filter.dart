
import 'package:app/features/category/domain/entities/category.dart';
import 'package:flutter/material.dart';

class SpendFilter {
  final Category? category;
  final DateTimeRange? spendRange; // dd.MM.yyyy - dd.MM.yyyy
  final RangeValues? amountRange; // min - max

  SpendFilter({
    this.category,
    this.spendRange,
    this.amountRange,
  });
}
