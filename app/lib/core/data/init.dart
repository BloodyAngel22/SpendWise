import 'package:app/core/constants/constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseInit {
  static Future<Database> init() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, DatabaseConstants.databaseName);

    // await deleteDatabase(path);

    final db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE ${DatabaseConstants.databaseCategoryTable} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL UNIQUE
          )
        ''');

        await db.execute('''
          CREATE TABLE ${DatabaseConstants.databaseSpendTable} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            amount REAL NOT NULL,
            spend_at TEXT NOT NULL,
            category_id INTEGER NOT NULL REFERENCES categories(id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          INSERT OR IGNORE INTO ${DatabaseConstants.databaseCategoryTable} (title) VALUES
            ('Супермаркеты'),
            ('Кафе и рестораны'),
            ('Транспорт и доставка'),
            ('Переводы'),
            ('Игры'),
            ('Аренда и жильё'),
            ('Коммунальные услуги'),
            ('Связь и интернет'),
            ('Здоровье и аптека')
        ''');
      },
    );

    return db;
  }
}
