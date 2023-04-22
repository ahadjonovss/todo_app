import 'package:todo_app/utils/tools/file_importer.dart';

class KeysRepository{
  static const String _boxName = 'keysBox';
  late Box<String> _box;

  Future<void> openBox() async {
    _box = await Hive.openBox<String>(_boxName);
    debugPrint("keysBox has been opened");

  }

  void addKey(String key) {
    List availableKeys = getKeys();
    if(!availableKeys.contains(key)){
      int id = _box.values.length+1;
      _box.put(id, key);
      debugPrint("$key added to storage");
    }
  }

  List<String> getKeys() {
     return _box.values.toList()..sort((a, b) => b.compareTo(a));
  }

}