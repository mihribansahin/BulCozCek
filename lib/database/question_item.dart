import 'dart:collection';

import 'package:bul_coz_cek_game/database/tables.dart';

class QuestionItem {
  int? queId;
  int? quePoint;
  String? question;
  String? answer;

  Map<dynamic, dynamic> QuestionItemToMap() {
    var item = Map<String, dynamic>();

    item[TableQuestions.que_id] = queId;
    item[TableQuestions.que_point] = quePoint;
    item[TableQuestions.question] = question;
    item[TableQuestions.answer] = answer;
    return item;
  }

  QuestionItem.fromMap(HashMap<String, dynamic> map) {
    this.queId = map[TableQuestions.que_id];
    this.quePoint = map[TableQuestions.que_point];
    this.question = map[TableQuestions.question];
    this.answer = map[TableQuestions.answer];
  }

  QuestionItem.fromJsonMap(Map<String, dynamic> json) {
    this.queId = json[TableQuestions.que_id];
    this.quePoint = json[TableQuestions.que_point];
    this.question = json[TableQuestions.question];
    this.answer = json[TableQuestions.answer];
  }

  Map<String, dynamic> toJson() => {
        TableQuestions.que_id: this.queId,
        TableQuestions.que_point: this.quePoint,
        TableQuestions.question: this.question,
        TableQuestions.answer: this.answer,
      };
}
