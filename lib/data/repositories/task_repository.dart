import 'package:todo_app/utils/tools/file_importer.dart';

class TaskRepository{
  static late final String _boxName;
  late Box<TaskModel> _box;

  Future<void> openBox(String boxName) async {
    _boxName = boxName;
    getIt<KeysRepository>().addKey(boxName);
  _box = await Hive.openBox<TaskModel>(_boxName);
  }

  updateBox(String boxName) async {
    print("Box has been updated");
    return await Hive.openBox<TaskModel>(boxName);
  }

  void addItem(TaskModel item) async {
    var box = await updateBox(item.boxName);
    item.id = _box.values.length+1;
  box.put(item.id, item);
   setNotification(item);

  }

  Future<MyResponse> getItems() async {
    MyResponse myResponse = MyResponse(tasks: []);
    try{
      List keys = getIt<KeysRepository>().getKeys();
      for(var i in keys){
        var myBox = await Hive.openBox<TaskModel>(i);
        myResponse.tasks.add(myBox.values.toList());
      }
    }catch(e){
      myResponse.errorMessage=e.toString();
    }
    return myResponse;
  }


  void updateItem(TaskModel item) async {
    var box = await updateBox(item.boxName);
    print("Mana box $box");
    box.put(item.id, item);
  }

  void deleteItem(TaskModel item) async {
    var box = await updateBox(item.boxName);
    box.delete(item.id);
    print("deleted");
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


   getTasksByCategory(List<List<TaskModel>> tasks){
    List<CategoryModel> filledCategories=[];
    for(CategoryModel category in categories){
      category.tasks.clear();
      for(var i in tasks){
        for(TaskModel j in i){
          if(category.title==j.category){
            category.tasks.add(j);
          }
        }
      }
      filledCategories.add(category);
    }
    return filledCategories;

  }


}