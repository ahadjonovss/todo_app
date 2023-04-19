import 'package:todo_app/utils/tools/file_importer.dart';

class SplashRepository{
  static const String _boxName = 'splashBox';
  late Box<bool> _box;

  Future<void> openBox() async {
    _box = await Hive.openBox<bool>(_boxName);
  }

  void register() {
    _box.put('isLoggedIn', true);
  }

  bool? isLoggedIn() {
    return _box.get('isLoggedIn',defaultValue: false);
  }



}