import 'package:todo_app/utils/tools/file_importer.dart';

class TaskRepository{
  static const String _boxName = 'todoBox';
  late Box<TaskModel> _box;

  Future<void> openBox() async {
  _box = await Hive.openBox<TaskModel>(_boxName);
  }

  void addItem(TaskModel item) {
    item.id = _box.values.length+1;
  _box.put(item.id, item);
  getIt<LocalNotificationService>().scheduleNotification(task: item, delayedTime: getDifference(item));

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

  int getDifference(TaskModel item){
    DateTime dateTime = DateTime.now();

    DateTime timeOnly = DateTime(dateTime.year, dateTime.month, dateTime.day,
        item.time.hour, item.time.minute);

    return timeOnly.difference(dateTime).inSeconds;

  }


}