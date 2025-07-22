import 'package:app/core/constants/constants.dart';
import 'package:app/features/category/domain/entities/category.dart';
import 'package:app/features/category/domain/irepositories/i_category_repository.dart';
import 'package:app/features/category/infrastructure/datamodels/category_model.dart';
import 'package:sqflite/sqflite.dart';

class CategoryRepository extends ICategoryRepository {
  final Database _db;

  CategoryRepository(this._db);

  @override
  Future<void> addCategory(CategoryModel category) async {
    await _db.insert(
      DatabaseConstants.databaseCategoryTable,
      category.toDbMap(),
    );
  }

  @override
  Future<void> deleteCategory(int categoryId) async {
    await _db.delete(
      DatabaseConstants.databaseCategoryTable,
      where: 'id = ?',
      whereArgs: [categoryId],
    );
  }

  @override
  Future<List<Category>> getCategories() async {
    final rows = await _db.rawQuery('''
      WITH RankedSpends AS (
				SELECT
						s.category_id,
						s.spend_at,
						ROW_NUMBER() OVER (PARTITION BY s.category_id ORDER BY s.spend_at DESC, s.id DESC) as rn
				FROM
						spends s
			),
			LatestSpendsForCategory AS (
					SELECT
							category_id,
							spend_at
					FROM
							RankedSpends
					WHERE
							rn = 1
			)
			SELECT
					c.id AS category_id,
					c.title AS category_name,
					ls.spend_at
			FROM
					categories c
			LEFT JOIN
					LatestSpendsForCategory ls ON c.id = ls.category_id
			ORDER BY
					c.title ASC,
					ls.spend_at DESC NULLS LAST;
    ''');

    return rows.map((row) {
      return Category(
        id: row['category_id'] as int,
        title: row['category_name'] as String,
        lastSpendAt: row['spend_at'] != null ? DateTime.parse(row['spend_at'] as String) : null,
      );
    }).toList();
  }

  @override
  Future<void> updateCategory(CategoryModel category) async {
    await _db.update(
      DatabaseConstants.databaseCategoryTable,
      category.toDbMap(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

  @override
  Future<Category> getCategory(int categoryId) async {
    final row = await _db.query(
      DatabaseConstants.databaseCategoryTable,
      where: 'id = ?',
      whereArgs: [categoryId],
    );
    return CategoryModel.fromDbMap(row.first).toEntity();
  }
}
