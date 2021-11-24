import 'dart:collection';

import 'package:bul_coz_cek_game/database/tables.dart';

class QuestionItem {
  int? queId;
  int? quePoint;
  String? question;
  String? answer;

  Map<dynamic, dynamic> QuestionItemToMap() {
    var item = Map<String, dynamic>();

    item[Questions.que_id] = queId;
    item[Questions.que_point] = quePoint;
    item[Questions.question] = question;
    item[Questions.answer] = answer;
    return item;
  }

  QuestionItem.fromMap(HashMap<String, dynamic> map) {
    this.queId = map[Questions.que_id];
    this.quePoint = map[Questions.que_point];
    this.question = map[Questions.question];
    this.answer = map[Questions.answer];
  }

  QuestionItem.fromJsonMap(Map<String, dynamic> json) {
    this.queId = json[Questions.que_id];
    this.quePoint = json[Questions.que_point];
    this.question = json[Questions.question];
    this.answer = json[Questions.answer];
  }

  Map<String, dynamic> toJson() => {
        Questions.que_id: this.queId,
        Questions.que_point: this.quePoint,
        Questions.question: this.question,
        Questions.answer: this.answer,
      };
}
