import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteDatabase {
  static Future<Database> sqlitedatabase() async {
    return await openDatabase(join(await getDatabasesPath(), "notesforapp.db"),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE notes (id INTEGER PRIMARY KEY, content TEXT, category TEXT)');
    });
  }
}
