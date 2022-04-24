import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:collection/collection.dart';
import 'package:hackunt2022/LeaderboardEntry.dart';

class LeaderboardDatabase {
	static final LeaderboardDatabase instance = LeaderboardDatabase._init();

	static Database? _database;

	LeaderboardDatabase._init();

	Future<Database> get database async {
		if (_database != null) return _database!;

		_database = await _initDB('leaderboard.db');
		return _database!;
	}

	Future<String> getPath() async {
		final dbPath = await getDatabasesPath();
		final path = join(dbPath, 'leaderboard.db');

		return await path;

	}

	Future<Database> _initDB(String filePath) async {
		final dbPath = await getDatabasesPath();
		final path = join(dbPath, filePath);

		return await openDatabase(path, version: 1, onCreate: _createDB);
	}

	Future _createDB(Database db, int version) async {
		final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
		final nameType = 'TEXT NOT NULL';
		final locationType = 'INTEGER NOT NULL';
		final scoreType = 'INTEGER NOT NULL';

		await db.execute('''CREATE TABLE $tableLeaderboard (${LeaderboardEntryFields
				.id} $idType, ${LeaderboardEntryFields
				.name} $nameType,${LeaderboardEntryFields.location} $locationType,${LeaderboardEntryFields.score} $scoreType)''');
	}

	Future<LeaderboardEntry> create(LeaderboardEntry entry) async {
		final db = await instance.database;

		final id = await db.insert(tableLeaderboard, entry.toJson());
		return entry.copy(id: id);
	}

	Future<LeaderboardEntry> readEntry(int id) async {
		final db = await instance.database;

		final maps = await db.query(
			tableLeaderboard,
			columns: LeaderboardEntryFields.values,
			where: '${LeaderboardEntryFields.id} = ?',
			whereArgs: [id],
		);

		if (maps.isNotEmpty) {
			return LeaderboardEntry.fromJson(maps.first);
		} else {
			throw Exception('ID $id cannot be found');
		}
	}

	Future<List<LeaderboardEntry>> readAllEntries() async {
		final db = await instance.database;


		final orderBy = '${LeaderboardEntryFields.location} ASC';
		final result = await db.query(tableLeaderboard);

		return result.map((json) => LeaderboardEntry.fromJson(json)).toList();
	}

	Future<int> update(LeaderboardEntry entry) async {
		final db = await instance.database;

		return db.update(tableLeaderboard, entry.toJson(),
				where: '${LeaderboardEntryFields.id} = ?', whereArgs: [entry.id]);
	}

	Future<int> delete(int id) async {
		final db = await instance.database;

		return await db.delete(
				tableLeaderboard, where: '${LeaderboardEntryFields.id} = ?',
				whereArgs: [id]);
	}
		Future close() async {
			final db = await instance.database;

			db.close();
		}
	}