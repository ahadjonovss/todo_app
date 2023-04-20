import 'package:todo_app/utils/tools/file_importer.dart';

class TaskRepository{
  static const String _boxName = 'todoBox';
  late Box<TaskModel> _box;

  Future<void> openBox() async {
  _box = await Hive.openBox<TaskModel>(_boxName);
  }

  void addItem(TaskModel item) {
  _box.put(item.id, item);
  print("Added");
  print(getItems());
  }

  List<TaskModel> getItems() {
  return _box.values.toList();
  }

  void updateItem(TaskModel item) {
  _box.put(item.id, item);
  }

  void deleteItem(int id) {
  _box.delete(id);
  }


}