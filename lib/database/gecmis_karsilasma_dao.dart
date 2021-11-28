import 'dart:collection';

import 'package:bul_coz_cek_game/database/karsilasma_item.dart';
import 'package:bul_coz_cek_game/database/tables.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import 'db.dart';
import 'gecmis_karsilasma_item.dart';

class GecmisKarsilasmaDao {
  late db _con;
  Database? _myDB;
  Map<String, dynamic>? _myValues;
  static final String TAG = (GecmisKarsilasmaDao).toString();

  GecmisKarsilasmaDao(Database? conn) {
    _myDB = conn;
  }

  void OpenSharedDataBase() {
    this._myDB = _con.database as Database?;
  }

  void CloseSharedDataBase() {
    if (this._myDB != null) this._myDB!.close();
    this._myDB = null;
  }

  void insert(GecmisKarsilasmaItem? item) {
    try {
      //getContent(item!);
      if (_myValues == null) {
        _myValues = new Map<String, dynamic>();
      }
      _myValues!.clear();
      _myValues![TableGecmisKarsilasmalar.finished_game_id] = item!.finishedGameId;
      _myValues![TableGecmisKarsilasmalar.game_id] = item.gameId;
      _myValues![TableGecmisKarsilasmalar.score] = item.score;
      _myValues![TableGecmisKarsilasmalar.winner_player_name] = item.winnerPlayerName;
      _myValues![TableGecmisKarsilasmalar.game_date] = item.gameDate;

      _myDB!.insert(TableGecmisKarsilasmalar.tableName, _myValues!);
      debugPrint("{$TAG, ${TableGecmisKarsilasmalar.tableName} +  insert succeeded}");
    } catch (e) {
      debugPrint("{$TAG KONTROL, $e");
    }
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<GecmisKarsilasmaItem>> findGecmisKarsilasma(int finishedGameId) async {
    // Get a reference to the database.
    final db = await this._myDB;

    // Query the table for all The cariItem.
    final List<Map<String, dynamic>> maps = await db!.rawQuery(
        "SELECT * FROM " +
            TableGecmisKarsilasmalar.tableName +
            " WHERE ${TableGecmisKarsilasmalar.finished_game_id} = '$finishedGameId' ");
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(
      maps.length,
          (i) {
        return GecmisKarsilasmaItem(
          finishedGameId: maps[i][TableGecmisKarsilasmalar.finished_game_id],
          gameId: maps[i][TableGecmisKarsilasmalar.game_id],
          winnerPlayerName: maps[i][TableGecmisKarsilasmalar.winner_player_name],
          gameDate : maps[i][TableGecmisKarsilasmalar.game_date],
          score: maps[i][TableGecmisKarsilasmalar.score],
        );
      },
    );
  }

  void deleteAll() {
    try {
      _myDB!.execute("DELETE FROM " + TableGecmisKarsilasmalar.tableName + ";VACUUM;");
      debugPrint("{$TAG, ${TableGecmisKarsilasmalar.tableName} +  truncated}");
    } catch (e) {
      debugPrint("{$TAG, $e}");
    }
  }

  ///bunları düzenleeeeee

  Future<int?> gecmisKarsilasmalarCount() async {
    int? count;
    //database connection
    try {
      Database? db = this._myDB;
      var x = await db!
          .rawQuery("select count(1) from " + TableGecmisKarsilasmalar.tableName, []);
      count = Sqflite.firstIntValue(x);
    } catch (e) {
      debugPrint("$TAG, $e");
    }
    return count;
  }
}
