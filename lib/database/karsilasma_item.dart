import 'dart:collection';

import 'package:bul_coz_cek_game/database/tables.dart';

class KarsilasmaAniItem{


  int? gameId;
  int? firstPlayerId;
  int? secondPlayerId;
  String? firstPlayerName;
  String? secondPlayerName;
  int? queId;



  Map<dynamic, dynamic> karsilasmaAniItemsToMap() {
    var karsilasmaItems = Map<String, dynamic>();

    karsilasmaItems[KarsilasmaAni.game_id] = gameId;
    karsilasmaItems[KarsilasmaAni.first_player_id] = firstPlayerId;
    karsilasmaItems[KarsilasmaAni.second_player_id] = secondPlayerId;
    karsilasmaItems[KarsilasmaAni.first_player_name] = firstPlayerName;
    karsilasmaItems[KarsilasmaAni.second_player_name] = secondPlayerName;
    karsilasmaItems[KarsilasmaAni.que_id] = queId;

    return karsilasmaItems;
  }

  KarsilasmaAniItem.fromMap(HashMap<String, dynamic> map) {
    this.gameId = map[KarsilasmaAni.game_id];
    this.firstPlayerId = map[KarsilasmaAni.first_player_id];
    this.secondPlayerId = map[KarsilasmaAni.second_player_id];
    this.secondPlayerName = map[KarsilasmaAni.second_player_name];
    this.queId = map[KarsilasmaAni.que_id];

  }

  KarsilasmaAniItem.fromJsonMap(Map<String, dynamic> json) {
    this.gameId = json[KarsilasmaAni.game_id];
    this.firstPlayerId = json[KarsilasmaAni.first_player_id];
    this.secondPlayerId = json[KarsilasmaAni.second_player_id];
    this.firstPlayerName = json[KarsilasmaAni.first_player_name];
    this.queId = json[KarsilasmaAni.que_id];

  }

  Map<String, dynamic> toJson() => {
    KarsilasmaAni.game_id: this.gameId,
    KarsilasmaAni.first_player_id: this.firstPlayerId,
    KarsilasmaAni.second_player_id: this.secondPlayerId,
    KarsilasmaAni.first_player_name: this.firstPlayerName,
    KarsilasmaAni.second_player_name: this.secondPlayerName,
    KarsilasmaAni.que_id: this.queId,

  };







}