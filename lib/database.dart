// ignore_for_file: constant_identifier_names

import 'package:flutter_sqlite/modals.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const DB_NAME = 'contacts_database.db';
  static const TABLE_NAME = 'contacts';
  static const COLUMN_ID = 'id';
  static const COLUMN_NAME = 'name';
  static const COLUMN_EMAIL = 'email';
  static const COLUMN_PHONE = 'phone';
  DatabaseHelper._();

  static Future<Database> get _instance async {
    return await openDatabase(
      join(await getDatabasesPath(), DB_NAME),
      version: 1,
      onCreate: (db, version) {
        String query =
            'CREATE TABLE $TABLE_NAME ($COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT, $COLUMN_NAME TEXT, $COLUMN_EMAIL TEXT, $COLUMN_PHONE TEXT)';
        return db.execute(query);
      },
    );
  }

  static Future<int> add(Person person) async {
    final db = await _instance;
    if (db.isOpen) {
      return await db.insert(TABLE_NAME, person.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    return -1;
  }

  static Future<int> delete(int id) async {
    final db = await _instance;
    if (db.isOpen) {
      return await db
          .delete(TABLE_NAME, where: '$COLUMN_ID = ?', whereArgs: [id]);
    }
    return 0;
  }

  static Future<int> update(int id, Person person) async {
    final db = await _instance;
    if (db.isOpen) {
      return await db.update(TABLE_NAME, person.toMap(),
          where: '$COLUMN_ID = ?', whereArgs: [id]);
    }
    return 0;
  }

  static Future<List<Person>> getData() async {
    final db = await _instance;
    if (db.isOpen) {
      final queryData = await db.query(TABLE_NAME);
      return queryData
          .map((Map<String, dynamic> e) => Person.id(
              e[COLUMN_ID], e[COLUMN_NAME], e[COLUMN_EMAIL], e[COLUMN_PHONE]))
          .toList();
    }
    return [];
  }

  static Future<int> deleteAll() async {
    final db = await _instance;
    if (db.isOpen) {
      return await db.delete(TABLE_NAME);
    }
    return 0;
  }
}
