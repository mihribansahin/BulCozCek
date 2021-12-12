import 'dart:collection';

import 'package:bul_coz_cek_game/database/tables.dart';
import 'package:bul_coz_cek_game/database/user_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import 'db.dart';

class UserDao {

  late db _con;
  Database? _myDB;
  Map<String, dynamic>? _myValues;
  static final String TAG = (UserDao).toString();

  UserDao(Database? conn) {
    _myDB = conn;
  }

  void OpenSharedDataBase() {
    this._myDB = _con.database as Database?;
  }

  void CloseSharedDataBase() {
    if (this._myDB != null) this._myDB!.close();
    this._myDB = null;
  }

  void insert(UserItem? item) {
    try {
      //getContent(item!);
      if (_myValues == null) {
        _myValues = new Map<String, dynamic>();
      }
      _myValues!.clear();
      _myValues![TableUsers.id] = item!.id;
      _myValues![TableUsers.username] = item.username;
      _myValues![TableUsers.point] = item.point;

      _myDB!.insert(TableUsers.tableName, _myValues!);
      debugPrint("{$TAG, ${TableUsers.tableName} +  insert succeeded}");
    } catch (e) {
      debugPrint("{$TAG KONTROL, $e");
    }
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<UserItem>> findUsername(String username) async {
    // Get a reference to the database.
    final db = await this._myDB;

    // Query the table for all The cariItem.
    final List<Map<String, dynamic>> maps = await db!.rawQuery(
        "SELECT * FROM " +
            TableUsers.tableName +
            " WHERE ${TableUsers.username} = '$username' ");
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(
      maps.length,
      (i) {
        return UserItem(
          id: maps[i][TableUsers.id],
          username: maps[i][TableUsers.username],
          point: maps[i][TableUsers.point],
        );
      },
    );
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<UserItem>> findAllUser() async {
    // Get a reference to the database.
    final db = await this._myDB;

    // Query the table for all The cariItem.
    final List<Map<String, dynamic>> maps = await db!.rawQuery(
        "SELECT * FROM " +
            TableUsers.tableName);
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(
      maps.length,
          (i) {
        return UserItem(
          id: maps[i][TableUsers.id],
          username: maps[i][TableUsers.username],
          point: maps[i][TableUsers.point],
        );
      },
    );
  }
  Future<List<UserItem>> findUserId(int userId) async {
    // Get a reference to the database.
    final db = await this._myDB;

    // Query the table for all The cariItem.
    final List<Map<String, dynamic>> maps = await db!.rawQuery(
        "SELECT * FROM " +
            TableUsers.tableName +
            " WHERE ${TableUsers.id} = '$userId' ");
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(
      maps.length,
      (i) {
        return UserItem(
          id: maps[i][TableUsers.id],
          username: maps[i][TableUsers.username],
          point: maps[i][TableUsers.point],
        );
      },
    );
  }

  void deleteAll() {
    try {
      _myDB!.execute("DELETE FROM " + TableUsers.tableName + ";VACUUM;");
      debugPrint("{$TAG, ${TableUsers.tableName} +  truncated}");
    } catch (e) {
      debugPrint("{$TAG, $e}");
    }
  }

  ///bunları düzenleeeeee

  Future<int?> userCount() async {
    int? count;
    //database connection
    try {
      Database? db = this._myDB;
      var x = await db!
          .rawQuery("select count(1) from " + TableUsers.tableName, []);
      count = Sqflite.firstIntValue(x);
    } catch (e) {
      debugPrint("$TAG, $e");
    }
    return count;
  }
}
