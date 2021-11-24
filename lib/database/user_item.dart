import 'dart:collection';

import 'package:bul_coz_cek_game/database/tables.dart';

class UserItem{


   int? id;
   String? username;
   int? point;



   Map<dynamic, dynamic> userItemToMap() {
     var userItems = Map<String, dynamic>();

     userItems[Users.id] = id;
     userItems[Users.username] = username;
     userItems[Users.point] = point;
     return userItems;
   }

   UserItem.fromMap(HashMap<String, dynamic> map) {
     this.id = map[Users.id];
     this.username = map[Users.username];
     this.point = map[Users.point];
   }



}