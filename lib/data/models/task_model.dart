class TaskModel {
  final int id;
  final String title;
  final String category;
  final DateTime time;

  TaskModel(
      {required this.title,
      required this.id,
      required this.category,
      required this.time});

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
      title: json["title"] ?? '',
      id: json["id"] ?? -1,
      category: json["type"] ?? '',
      time: json["time"] ?? DateTime.now());


  toJson()=>{
    "id":id,
    "title":title,
    "type":category,
    "time":time
  };

  copyWith({
     int? id,
     String? title,
     String? type,
     DateTime? time
})=>TaskModel(title: title??this.title, id: id??this.id, category: type??category, time: time??this.time);
}
