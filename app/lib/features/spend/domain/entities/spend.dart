class Spend {
  final int id;
  final String title;
  final double amount;
  final DateTime spendAt;
  final String categoryName;

  Spend({
    required this.id,
    required this.title,
    required this.amount,
    required this.spendAt,
    required this.categoryName,
  });
}
