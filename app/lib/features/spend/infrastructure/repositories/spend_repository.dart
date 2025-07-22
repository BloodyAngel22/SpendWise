import 'package:app/core/constants/constants.dart';
import 'package:app/features/category/infrastructure/datamodels/category_model.dart';
import 'package:app/features/spend/domain/entities/spend.dart';
import 'package:app/features/spend/domain/irepositories/i_spend_repository.dart';
import 'package:app/features/spend/infrastructure/datamodels/spend_model.dart';
import 'package:sqflite/sqflite.dart';

class SpendRepository extends ISpendRepository {
  final Database _db;

  SpendRepository(this._db);

  @override
  Future<void> addSpend(SpendModel spend) async {
    await _db.insert(DatabaseConstants.databaseSpendTable, spend.toDbMap());
  }

  @override
  Future<void> deleteSpend(int spendId) async {
    await _db.delete(
      DatabaseConstants.databaseSpendTable,
      where: 'id = ?',
      whereArgs: [spendId],
    );
  }

  @override
  Future<List<Spend>> getSpends() async {
    final results = await _db.rawQuery('''
      SELECT 
        s.id as spend_id,
        s.title as spend_title,
        s.amount,
        s.spend_at,
        c.id as category_id,
        c.title as category_title
        FROM ${DatabaseConstants.databaseSpendTable} s 
        JOIN ${DatabaseConstants.databaseCategoryTable} c 
        ON s.category_id = c.id;
    ''');

    return results.map((row) {
      final category = CategoryModel(
        id: row['category_id'] as int,
        title: row['category_title'] as String,
      );
      return Spend(
        id: row['spend_id'] as int,
        title: row['spend_title'] as String,
        amount: row['amount'] as double,
        spendAt: DateTime.parse(row['spend_at'] as String),
        categoryName: category.title,
      );
    }).toList();
  }

  @override
  Future<void> updateSpend(SpendModel spend) async {
    await _db.update(
      DatabaseConstants.databaseSpendTable,
      spend.toDbMap(),
      where: 'id = ?',
      whereArgs: [spend.id],
    );
  }
}
