import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DatabaseService {
  static Database? _db;

  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    _db = await openDatabase(
      join(dbPath, 'attendance.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE students(id TEXT PRIMARY KEY, name TEXT)
        ''');
        await db.execute('''
          CREATE TABLE courses(code TEXT PRIMARY KEY, name TEXT)
        ''');
        await db.execute('''
          CREATE TABLE attendance(id INTEGER PRIMARY KEY AUTOINCREMENT, studentId TEXT, courseCode TEXT, action TEXT, timestamp TEXT)
        ''');
      },
      version: 1,
    );
    return _db!;
  }

  // Add more CRUD operations here...
}
