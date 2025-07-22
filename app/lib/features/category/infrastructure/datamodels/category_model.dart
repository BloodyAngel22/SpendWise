import 'package:app/features/category/domain/entities/category.dart';

class CategoryModel {
  final int? id;
  final String title;

  static const maxTitleLength = 50;

  CategoryModel({required this.id, required this.title});

  Map<String, dynamic> toDbMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory CategoryModel.fromDbMap(Map<String, dynamic> map) {
    return CategoryModel(id: map['id'], title: map['title']);
  }

  Category toEntity() {
    return Category(id: id!, title: title, lastSpendAt: null);
  }
}
