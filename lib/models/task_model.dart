class TaskModel {
  String id;
  String title;
  String description;
  String date;
  String time;
  bool status;

  TaskModel(
      {this.id = '',
      required this.title,
      required this.description,
      required this.date,
      required this.time,
      required this.status});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            title: json['title'],
            description: json['description'],
            date: json['date'],
            time: json['time'],
            status: json['status']);

  // TaskModel fromJson(Map<String, dynamic> json) {
  //   TaskModel taskModel = TaskModel(
  //       id: json['id'],
  //       title: json['title'],
  //       description: json['description'],
  //       date: json['date'],
  //       time: json['time'],
  //       status: json['status']);
  //   return taskModel;
  // }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'time': time,
      'status': status
    };
  }
}
