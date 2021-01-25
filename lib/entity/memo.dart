import 'package:flutter/cupertino.dart';

class Memo {
  int id;
  String text;
  DateTime createdAt;
  bool isPositive;
  bool isSelected;

  Memo(
      {this.id,
      this.text,
      this.createdAt,
      this.isPositive,
      this.isSelected = false});

  Map<String, dynamic> toDatabaseJson() => {
        'id': this.id,
        'text': this.text,
        'created_at': this.createdAt.toUtc().toIso8601String(),
        'is_positive': this.isPositive ? 1 : 0,
        'is_selected': this.isSelected ? 1 : 0,
      };

  factory Memo.fromDatabaseJson(Map<String, dynamic> data) => Memo(
        id: data['id'],
        text: data['text'],
        createdAt: DateTime.parse(data["created_at"]).toLocal(),
        isPositive: data['is_positive'] == 1 ? true : false,
        isSelected: data['is_selected'] == 1 ? true : false,
      );
}
