
import 'package:todo_app/utils/tools/file_importer.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerLazySingleton(() => SplashRepository());
  getIt.registerLazySingleton(() => TaskRepository());
  await getIt<SplashRepository>().openBox();
  await getIt<TaskRepository>().openBox();


}