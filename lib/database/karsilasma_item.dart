import 'dart:collection';

import 'package:bul_coz_cek_game/database/tables.dart';

class KarsilasmaAniItem{


  int? gameId;
  int? firstPlayerId;
  int? secondPlayerId;
  String? firstPlayerName;
  String? secondPlayerName;
  int? queId;


  KarsilasmaAniItem(
      {this.gameId,
      this.firstPlayerId,
      this.secondPlayerId,
      this.firstPlayerName,
      this.secondPlayerName,
      this.queId});

  Map<dynamic, dynamic> karsilasmaAniItemsToMap() {
    var karsilasmaItems = Map<String, dynamic>();

    karsilasmaItems[TableKarsilasmaAni.game_id] = gameId;
    karsilasmaItems[TableKarsilasmaAni.first_player_id] = firstPlayerId;
    karsilasmaItems[TableKarsilasmaAni.second_player_id] = secondPlayerId;
    karsilasmaItems[TableKarsilasmaAni.first_player_name] = firstPlayerName;
    karsilasmaItems[TableKarsilasmaAni.second_player_name] = secondPlayerName;
    karsilasmaItems[TableKarsilasmaAni.que_id] = queId;

    return karsilasmaItems;
  }

  KarsilasmaAniItem.fromMap(HashMap<String, dynamic> map) {
    this.gameId = map[TableKarsilasmaAni.game_id];
    this.firstPlayerId = map[TableKarsilasmaAni.first_player_id];
    this.secondPlayerId = map[TableKarsilasmaAni.second_player_id];
    this.secondPlayerName = map[TableKarsilasmaAni.second_player_name];
    this.queId = map[TableKarsilasmaAni.que_id];

  }

  KarsilasmaAniItem.fromJsonMap(Map<String, dynamic> json) {
    this.gameId = json[TableKarsilasmaAni.game_id];
    this.firstPlayerId = json[TableKarsilasmaAni.first_player_id];
    this.secondPlayerId = json[TableKarsilasmaAni.second_player_id];
    this.firstPlayerName = json[TableKarsilasmaAni.first_player_name];
    this.queId = json[TableKarsilasmaAni.que_id];

  }

  Map<String, dynamic> toJson() => {
    TableKarsilasmaAni.game_id: this.gameId,
    TableKarsilasmaAni.first_player_id: this.firstPlayerId,
    TableKarsilasmaAni.second_player_id: this.secondPlayerId,
    TableKarsilasmaAni.first_player_name: this.firstPlayerName,
    TableKarsilasmaAni.second_player_name: this.secondPlayerName,
    TableKarsilasmaAni.que_id: this.queId,

  };







}