import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class LeaderboardDatabase {
  static final LeaderboardDatabase instance = LeaderboardDatabase._init();

  static Database? _database;

  LeaderboardDatabase._init();

  Future<Database> get database async {
    if(_database != null) return _database;

    _database = await _initDB('leaderboard.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) asycn {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, verison: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {

  }

  Future close() async{
    final db = await instance.database;

    db.close();
  }
}