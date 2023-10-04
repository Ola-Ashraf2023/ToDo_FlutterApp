import 'package:flutter/material.dart';

class TaskModel {
  String title;
  bool isDone;
  int date;
  String time;
  String id;

  TaskModel(
      {required this.title,
      this.isDone = false,
      required this.date,
      this.id = "",
      required this.time});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            isDone: json['isDone'],
            date: json['date'],
            title: json['title'],
            time: json['time']);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "isDone": isDone,
      "date": date,
      "time": time
    };
  }
}
