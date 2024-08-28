import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'cart.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cart(
        id INTEGER PRIMARY KEY,
        imagePath TEXT,
        price TEXT,
        rating TEXT,
        description TEXT,
        area TEXT,
        courtType TEXT
      )
    ''');
  }

  Future<int> insertCartItem(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('cart', row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query('cart');
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete('cart', where: 'id = ?', whereArgs: [id]);
  }
}
