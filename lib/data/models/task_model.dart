class TaskModel {
  final int id;
  final String title;
  final String type;
  final DateTime time;

  TaskModel(
      {required this.title,
      required this.id,
      required this.type,
      required this.time});

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
      title: json["title"] ?? '',
      id: json["id"] ?? -1,
      type: json["type"] ?? '',
      time: json["time"] ?? DateTime.now());


  toJson()=>{
    "id":id,
    "title":title,
    "type":type,
    "time":time
  };

  copyWith({
     int? id,
     String? title,
     String? type,
     DateTime? time
})=>TaskModel(title: title??this.title, id: id??this.id, type: type??this.type, time: time??this.time);
}
