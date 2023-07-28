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

  Future<Database> get _instance async {
    return await openDatabase(
      join(await getDatabasesPath(), DB_NAME),
      onCreate: (db, version) {
        String query =
            'CREATE TABLE $TABLE_NAME ($COLUMN_ID INTEGER PRIMARY KEY AUTOINCREAMENT, $COLUMN_NAME TEXT, $COLUMN_EMAIL TEXT, $COLUMN_PHONE TEXT)';
        return db.execute(query);
      },
    );
  }

  Future<int> add(String name, String email, String phone) async {
    final db = await _instance;
    if (db.isOpen) {
      final person = Person(name, email, phone);
      return await db.insert(TABLE_NAME, person.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    return -1;
  }
}
