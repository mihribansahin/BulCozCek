import 'package:bul_coz_cek_game/database/db.dart';
import 'package:bul_coz_cek_game/database/user_dao.dart';
import 'package:bul_coz_cek_game/database/user_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Collection {
  static User user = User();
  static GecmisKarsilasma gecmisKarsilasma = GecmisKarsilasma();
  static Question question = Question();
  static Karsilasma karsilasma = Karsilasma();
  static late db database;

  static String DateToStringYMDHMS() {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    String date = dateFormat.format(DateTime.now());
    return date;

    //return dateFormat.format(new DateTime.fromMillisecondsSinceEpoch(value*1000));
  }

  static String DateToStringYMD() {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    String date = dateFormat.format(DateTime.now());
    return date;
  }

  static void controlDB(BuildContext context) {
    if (database == null) {
      database = new db();
    }
  }
}

class User{
  static UserDao? dao;

  static Future<UserDao?> _controlDAO() async {
    if (dao == null) {
      //  debugPrint("KONTROL DAO NULL");
      dao = new UserDao(await db().database);
      if (dao != null) {
        //debugPrint("KONTROL CariDAO DAO ARTIK NULL DEGİL");
        return dao;
      }

      return dao;
    }

    //if (dao == null) dao = new cariDAO(Collection.database);
  }

  static Future<void> OpenSharedDataBase() async {
    await _controlDAO();
    dao!.OpenSharedDataBase();
  }

  static void CloseSharedDataBase() {
    if (dao != null) dao!.CloseSharedDataBase();
  }

  static void save(UserItem? item) async {
    await _controlDAO();
    dao!.insert(item!);
  }

  static void deleteAll() async {
    await _controlDAO();
    dao!.deleteAll();
  }

  static Future<List<UserItem>> findUsername(String username) async {
    await _controlDAO();
    return await dao!.find(username);
  }



  static Future<int?> userCount() async {
    await _controlDAO();
    return dao!.userCount();
  }
}
class GecmisKarsilasma{

}
class Question{

}
class Karsilasma{

}