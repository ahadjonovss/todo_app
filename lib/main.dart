import 'package:todo_app/utils/tools/file_importer.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(TaskAdapter());
  setup();
  Bloc.observer = AppBlocObserver();
  runApp( App());
}