import 'dart:collection';

import 'package:bul_coz_cek_game/database/tables.dart';

class UserItem {
  int? id;
  String? username;
  int? point;
  UserItem({this.id, this.username, this.point});

  Map<dynamic, dynamic> userItemToMap() {
    var userItems = Map<String, dynamic>();

    userItems[TableUsers.id] = id;
    userItems[TableUsers.username] = username;
    userItems[TableUsers.point] = point;
    return userItems;
  }

  UserItem.fromMap(HashMap<String, dynamic> map) {
    this.id = map[TableUsers.id];
    this.username = map[TableUsers.username];
    this.point = map[TableUsers.point];
  }

  UserItem.fromJsonMap(Map<String, dynamic> json) {
    this.id = json[TableUsers.id];
    this.username = json[TableUsers.username];
    this.point = json[TableUsers.point];
  }

  Map<String, dynamic> toJson() => {
        TableUsers.id: this.id,
        TableUsers.username: this.username,
        TableUsers.point: this.point,
      };
}
