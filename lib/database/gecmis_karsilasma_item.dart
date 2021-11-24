import 'dart:collection';

import 'package:bul_coz_cek_game/database/tables.dart';

class GecmisKarsilasmaItem {
  int? finishedGameId;
  int? gameId;
  DateTime? gameDate;
  int? score;
  String? winnerPlayerName;


  Map<dynamic, dynamic> gecmisKarsilasmaItemToMap() {
    var items = Map<String, dynamic>();

    items[GecmisKarsilasmalar.finished_game_id] = finishedGameId;
    items[GecmisKarsilasmalar.game_id] = gameId;
    items[GecmisKarsilasmalar.game_date] = gameDate;
    items[GecmisKarsilasmalar.score] = score;
    items[GecmisKarsilasmalar.winner_player_name] = winnerPlayerName;

    return items;
  }

  GecmisKarsilasmaItem.fromMap(HashMap<String, dynamic> map) {
    this.finishedGameId = map[GecmisKarsilasmalar.finished_game_id];
    this.gameId = map[GecmisKarsilasmalar.game_id];
    this.gameDate = map[GecmisKarsilasmalar.game_date];
    this.score = map[GecmisKarsilasmalar.score];
    this.winnerPlayerName = map[GecmisKarsilasmalar.winner_player_name];

  }

  GecmisKarsilasmaItem.fromJsonMap(Map<String, dynamic> json) {
    this.finishedGameId = json[GecmisKarsilasmalar.finished_game_id];
    this.gameId = json[GecmisKarsilasmalar.game_id];
    this.gameDate = json[GecmisKarsilasmalar.game_date];
    this.score = json[GecmisKarsilasmalar.score];
    this.winnerPlayerName = json[GecmisKarsilasmalar.winner_player_name];

  }

  Map<String, dynamic> toJson() => {
    GecmisKarsilasmalar.finished_game_id: this.finishedGameId,
    GecmisKarsilasmalar.game_id: this.gameId,
    GecmisKarsilasmalar.game_date: this.gameDate,
    GecmisKarsilasmalar.score: this.score,
    GecmisKarsilasmalar.winner_player_name: this.winnerPlayerName,

  };
}
