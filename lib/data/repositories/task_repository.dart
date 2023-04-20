import 'package:todo_app/data/models/my_response.dart';
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
   setNotification(item);

  }

  MyResponse getItems() {
    MyResponse myResponse = MyResponse();
    try{
      myResponse.tasks = _box.values.toList();
    }catch(e){
      myResponse.errorMessage=e.toString();
    }
    return myResponse;
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

  cancelNotification(int id){
    getIt<LocalNotificationService>().cancelNotificationById(id);
  }

  setNotification(TaskModel item){
    getIt<LocalNotificationService>().scheduleNotification(task: item, delayedTime: getDifference(item));
  }


}