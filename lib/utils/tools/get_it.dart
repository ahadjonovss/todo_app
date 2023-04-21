import 'package:todo_app/utils/tools/file_importer.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerLazySingleton(() => SplashRepository());
  getIt.registerLazySingleton(() => TaskRepository());
  getIt.registerLazySingleton(() => KeysRepository());
  getIt.registerLazySingleton(() => LocalNotificationService());
  getIt<LocalNotificationService>().init();

  await getIt<SplashRepository>().openBox();
  await getIt<KeysRepository>().openBox();
  await getIt<TaskRepository>().openBox();



}