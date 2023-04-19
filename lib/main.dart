import 'package:todo_app/utils/tools/file_importer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //StorageService.getInstance();
  setup();
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp( App());
}