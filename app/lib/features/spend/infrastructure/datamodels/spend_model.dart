import 'package:app/features/spend/domain/entities/spend.dart';

class SpendModel {
  final int? id;
  final String title;
  final double amount;
  final DateTime spendAt;
  final int categoryId;

  static const maxTitleLength = 50;
  static const maxAmount = 1_000_000;

  SpendModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.spendAt,
    required this.categoryId,
  });

  Map<String, dynamic> toDbMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'spend_at': spendAt.toIso8601String(),
      'category_id': categoryId,
    };
  }

  factory SpendModel.fromDbMap(Map<String, dynamic> map) {
    return SpendModel(
      id: map['id'],
      title: map['title'],
      amount: map['amount'],
      spendAt: DateTime.parse(map['spend_at']),
      categoryId: map['category_id'],
    );
  }

  Spend toEntity(String categoryName) {
    return Spend(
      id: id!,
      title: title,
      amount: amount,
      spendAt: spendAt,
      categoryName: categoryName,
    );
  }
}
