import 'package:hive/hive.dart';
import 'package:todo_app/data/models/task_model.dart';

import '../../utils/tools/file_importer.dart';

class TaskAdapter extends TypeAdapter<TaskModel>{
  @override
  final int typeId = 0; // a unique identifier for the type

  @override
  TaskModel read(BinaryReader reader) {
    final id = reader.readInt();
    final title = reader.readString();
    final category = reader.readString();
    final time = TimeOfDay(hour: int.parse(reader.readString().split(":")[0]), minute: int.parse(reader.readString().split(":")[1]));
    final day = DateTime.parse(reader.readString());
    return TaskModel(
      id: id,
      title: title,
      category: category,
      time: time,
      day: day,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.category);
    writer.writeString(obj.time.toString());
    writer.writeString(obj.day.toString());
  }

}