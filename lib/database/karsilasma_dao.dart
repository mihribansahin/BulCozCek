import 'dart:collection';

import 'package:bul_coz_cek_game/database/karsilasma_item.dart';
import 'package:bul_coz_cek_game/database/tables.dart';
import 'package:bul_coz_cek_game/database/user_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import 'db.dart';

class KarsilasmaDao {
  late db _con;
  Database? _myDB;
  Map<String, dynamic>? _myValues;
  static final String TAG = (KarsilasmaDao).toString();

  KarsilasmaDao(Database? conn) {
    _myDB = conn;
  }

  void OpenSharedDataBase() {
    this._myDB = _con.database as Database?;
  }

  void CloseSharedDataBase() {
    if (this._myDB != null) this._myDB!.close();
    this._myDB = null;
  }

  void insert(KarsilasmaAniItem? item) {
    try {
      //getContent(item!);
      if (_myValues == null) {
        _myValues = new Map<String, dynamic>();
      }
      _myValues!.clear();
      _myValues![TableKarsilasmaAni.game_id] = item!.gameId;
      _myValues![TableKarsilasmaAni.que_id] = item.queId;
      _myValues![TableKarsilasmaAni.first_player_id] = item.firstPlayerId;
      _myValues![TableKarsilasmaAni.first_player_name] = item.firstPlayerName;
      _myValues![TableKarsilasmaAni.second_player_id] = item.secondPlayerId;
      _myValues![TableKarsilasmaAni.second_player_name] = item.secondPlayerName;

      _myDB!.insert(TableKarsilasmaAni.tableName, _myValues!);
      debugPrint("{$TAG, ${TableKarsilasmaAni.tableName} +  insert succeeded}");
    } catch (e) {
      debugPrint("{$TAG KONTROL, $e");
    }
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<KarsilasmaAniItem>> findKarsilasma(int  gameId) async {
    // Get a reference to the database.
    final db = await this._myDB;

    // Query the table for all The cariItem.
    final List<Map<String, dynamic>> maps = await db!.rawQuery(
        "SELECT * FROM " +
            TableUsers.tableName +
            " WHERE ${TableKarsilasmaAni.game_id} = '$gameId' ");
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(
      maps.length,
          (i) {
        return KarsilasmaAniItem(
          gameId: maps[i][TableKarsilasmaAni.game_id],
          queId: maps[i][TableKarsilasmaAni.que_id],
          firstPlayerId: maps[i][TableKarsilasmaAni.first_player_id],
          firstPlayerName: maps[i][TableKarsilasmaAni.first_player_name],
          secondPlayerId: maps[i][TableKarsilasmaAni.second_player_id],
          secondPlayerName: maps[i][TableKarsilasmaAni.second_player_name],
        );
      },
    );
  }

  void deleteAll() {
    try {
      _myDB!.execute("DELETE FROM " + TableKarsilasmaAni.tableName + ";VACUUM;");
      debugPrint("{$TAG, ${TableKarsilasmaAni.tableName} +  truncated}");
    } catch (e) {
      debugPrint("{$TAG, $e}");
    }
  }

  ///bunları düzenleeeeee

  Future<int?> karsilasmaCount() async {
    int? count;
    //database connection
    try {
      Database? db = this._myDB;
      var x = await db!
          .rawQuery("select count(1) from " + TableKarsilasmaAni.tableName, []);
      count = Sqflite.firstIntValue(x);
    } catch (e) {
      debugPrint("$TAG, $e");
    }
    return count;
  }
}
