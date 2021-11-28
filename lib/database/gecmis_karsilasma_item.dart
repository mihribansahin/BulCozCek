import 'dart:collection';

import 'package:bul_coz_cek_game/database/tables.dart';

class GecmisKarsilasmaItem {
  int? finishedGameId;
  int? gameId;
  DateTime? gameDate;
  int? score;
  String? winnerPlayerName;
  GecmisKarsilasmaItem({this.finishedGameId,this.gameId, this.gameDate, this.score, this.winnerPlayerName});
  Map<dynamic, dynamic> gecmisKarsilasmaItemToMap() {
    var items = Map<String, dynamic>();

    items[TableGecmisKarsilasmalar.finished_game_id] = finishedGameId;
    items[TableGecmisKarsilasmalar.game_id] = gameId;
    items[TableGecmisKarsilasmalar.game_date] = gameDate;
    items[TableGecmisKarsilasmalar.score] = score;
    items[TableGecmisKarsilasmalar.winner_player_name] = winnerPlayerName;

    return items;
  }

  GecmisKarsilasmaItem.fromMap(HashMap<String, dynamic> map) {
    this.finishedGameId = map[TableGecmisKarsilasmalar.finished_game_id];
    this.gameId = map[TableGecmisKarsilasmalar.game_id];
    this.gameDate = map[TableGecmisKarsilasmalar.game_date];
    this.score = map[TableGecmisKarsilasmalar.score];
    this.winnerPlayerName = map[TableGecmisKarsilasmalar.winner_player_name];

  }

  GecmisKarsilasmaItem.fromJsonMap(Map<String, dynamic> json) {
    this.finishedGameId = json[TableGecmisKarsilasmalar.finished_game_id];
    this.gameId = json[TableGecmisKarsilasmalar.game_id];
    this.gameDate = json[TableGecmisKarsilasmalar.game_date];
    this.score = json[TableGecmisKarsilasmalar.score];
    this.winnerPlayerName = json[TableGecmisKarsilasmalar.winner_player_name];

  }

  Map<String, dynamic> toJson() => {
    TableGecmisKarsilasmalar.finished_game_id: this.finishedGameId,
    TableGecmisKarsilasmalar.game_id: this.gameId,
    TableGecmisKarsilasmalar.game_date: this.gameDate,
    TableGecmisKarsilasmalar.score: this.score,
    TableGecmisKarsilasmalar.winner_player_name: this.winnerPlayerName,

  };
}
