import 'dart:collection';

import 'package:bul_coz_cek_game/database/question_item.dart';
import 'package:bul_coz_cek_game/database/tables.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import 'db.dart';

class QuestionDao {
  late db _con;
  Database? _myDB;
  Map<String, dynamic>? _myValues;
  static final String TAG = (QuestionDao).toString();

  QuestionDao(Database? conn) {
    _myDB = conn;
  }

  void OpenSharedDataBase() {
    this._myDB = _con.database as Database?;
  }

  void CloseSharedDataBase() {
    if (this._myDB != null) this._myDB!.close();
    this._myDB = null;
  }

  void insert(QuestionItem? item) {
    try {
      //getContent(item!);
      if (_myValues == null) {
        _myValues = new Map<String, dynamic>();
      }
      _myValues!.clear();
      _myValues![TableQuestions.que_id] = item!.queId;
      _myValues![TableQuestions.question] = item.question;
      _myValues![TableQuestions.que_point] = item.quePoint;
      _myValues![TableQuestions.answer] = item.answer;

      _myDB!.insert(TableQuestions.tableName, _myValues!);
      debugPrint("{$TAG, ${TableQuestions.tableName} +  insert succeeded}");
    } catch (e) {
      debugPrint("{$TAG KONTROL, $e");
    }
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<QuestionItem>> find(int queId) async {
    // Get a reference to the database.
    final db = await this._myDB;

    // Query the table for all The cariItem.
    final List<Map<String, dynamic>> maps = await db!.rawQuery(
        "SELECT * FROM " +
            TableQuestions.tableName +
            " WHERE ${TableQuestions.que_id} = '$queId' ");
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(
      maps.length,
          (i) {
        return QuestionItem(
          queId : maps[i][TableQuestions.que_id],
          question : maps[i][TableQuestions.question],
          answer : maps[i][TableQuestions.answer],
          quePoint : maps[i][TableQuestions.que_point],
        );
      },
    );
  }

  void deleteAll() {
    try {
      _myDB!.execute("DELETE FROM " + TableQuestions.tableName + ";VACUUM;");
      debugPrint("{$TAG, ${TableQuestions.tableName} +  truncated}");
    } catch (e) {
      debugPrint("{$TAG, $e}");
    }
  }

  ///bunları düzenleeeeee

  Future<int?> questionCount() async {
    int? count;
    //database connection
    try {
      Database? db = this._myDB;
      var x = await db!
          .rawQuery("select count(1) from " + TableQuestions.tableName, []);
      count = Sqflite.firstIntValue(x);
    } catch (e) {
      debugPrint("$TAG, $e");
    }
    return count;
  }
}
