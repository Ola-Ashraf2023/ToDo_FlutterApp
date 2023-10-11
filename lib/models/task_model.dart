class TaskModel {
  String title;
  bool isDone;
  int date;
  String time;
  String id;
  String userId;

  TaskModel(
      {required this.title,
      this.isDone = false,
      required this.date,
      this.id = "",
      required this.time,
      required this.userId});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            isDone: json['isDone'],
            date: json['date'],
            title: json['title'],
            time: json['time'],
            userId: json['userId']);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "isDone": isDone,
      "date": date,
      "time": time,
      "userId": userId,
    };
  }
}
