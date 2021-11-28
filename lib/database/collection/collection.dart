import 'package:bul_coz_cek_game/database/db.dart';
import 'package:bul_coz_cek_game/database/gecmis_karsilasma_dao.dart';
import 'package:bul_coz_cek_game/database/gecmis_karsilasma_item.dart';
import 'package:bul_coz_cek_game/database/karsilasma_dao.dart';
import 'package:bul_coz_cek_game/database/karsilasma_item.dart';
import 'package:bul_coz_cek_game/database/question_dao.dart';
import 'package:bul_coz_cek_game/database/question_item.dart';
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

class User {
  static UserDao? dao;

  static Future<UserDao?> _controlDAO() async {
    if (dao == null) {
      dao = new UserDao(await db().database);
      if (dao != null) {
        return dao;
      }

      return dao;
    }
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
    return await dao!.findUsername(username);
  }

  static Future<List<UserItem>> finAlldUser() async {
    await _controlDAO();
    return await dao!.findAllUser();
  }

  static Future<int?> userCount() async {
    await _controlDAO();
    return dao!.userCount();
  }
}

class Question {
  static QuestionDao? dao;

  static Future<QuestionDao?> _controlDAO() async {
    if (dao == null) {
      dao = new QuestionDao(await db().database);
      if (dao != null) {
        return dao;
      }

      return dao;
    }
  }

  static Future<void> OpenSharedDataBase() async {
    await _controlDAO();
    dao!.OpenSharedDataBase();
  }

  static void CloseSharedDataBase() {
    if (dao != null) dao!.CloseSharedDataBase();
  }

  static void save(QuestionItem? item) async {
    await _controlDAO();
    dao!.insert(item!);
  }

  static void deleteAll() async {
    await _controlDAO();
    dao!.deleteAll();
  }

  static Future<List<QuestionItem>> findUsername(int queId) async {
    await _controlDAO();
    return await dao!.find(queId);
  }

  static Future<int?> questionCount() async {
    await _controlDAO();
    return dao!.questionCount();
  }
}

class Karsilasma {
  static KarsilasmaDao? dao;

  static Future<KarsilasmaDao?> _controlDAO() async {
    if (dao == null) {
      dao = new KarsilasmaDao(await db().database);
      if (dao != null) {
        return dao;
      }

      return dao;
    }
  }

  static Future<void> OpenSharedDataBase() async {
    await _controlDAO();
    dao!.OpenSharedDataBase();
  }

  static void CloseSharedDataBase() {
    if (dao != null) dao!.CloseSharedDataBase();
  }

  static void save(KarsilasmaAniItem? item) async {
    await _controlDAO();
    dao!.insert(item!);
  }

  static void deleteAll() async {
    await _controlDAO();
    dao!.deleteAll();
  }

  static Future<List<KarsilasmaAniItem>> findKarsilasma(int queId) async {
    await _controlDAO();
    return await dao!.findKarsilasma(queId);
  }

  static Future<int?> karsilasmaCount() async {
    await _controlDAO();
    return dao!.karsilasmaCount();
  }
}

class GecmisKarsilasma {
  static GecmisKarsilasmaDao? dao;

  static Future<GecmisKarsilasmaDao?> _controlDAO() async {
    if (dao == null) {
      dao = new GecmisKarsilasmaDao(await db().database);
      if (dao != null) {
        return dao;
      }

      return dao;
    }
  }

  static Future<void> OpenSharedDataBase() async {
    await _controlDAO();
    dao!.OpenSharedDataBase();
  }

  static void CloseSharedDataBase() {
    if (dao != null) dao!.CloseSharedDataBase();
  }

  static void save(GecmisKarsilasmaItem? item) async {
    await _controlDAO();
    dao!.insert(item!);
  }

  static void deleteAll() async {
    await _controlDAO();
    dao!.deleteAll();
  }

  static Future<List<GecmisKarsilasmaItem>> findGecmisKarsilasma(
      int finishedGameId) async {
    await _controlDAO();
    return await dao!.findGecmisKarsilasma(finishedGameId);
  }

  static Future<int?> gecmisKarsilasmaCount() async {
    await _controlDAO();
    return dao!.gecmisKarsilasmalarCount();
  }
}
