import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  DatabaseHelper.internal();

  Future<Database> initDatabase() async {
    final pathStr = path.join(await getDatabasesPath(), 'database.db');

    return await openDatabase(
      pathStr,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE tokens(id INTEGER PRIMARY KEY, token TEXT)',
        );
      },
    );
  }

  Future<void> saveToken(String token) async {
    final db = await database;
    await db.rawInsert(
      'INSERT INTO tokens(token) VALUES(?)',
      [token],
    );
  }

  Future<String?> getToken() async {
    final db = await database;
    final result = await db.rawQuery('SELECT token FROM tokens');
    if (result.isNotEmpty) {
      return result.first['token'] as String?;
    }
    return null;
  }

  Future<void> deleteToken() async {
    final db = await database;
    await db.rawDelete('DELETE FROM tokens');
  }
}
