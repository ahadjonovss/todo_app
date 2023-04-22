import 'package:todo_app/utils/tools/file_importer.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  String key = DateTime.now().toString().split(' ')[0];
  getIt.registerLazySingleton(() => SplashRepository());
  getIt.registerLazySingleton(() => TaskRepository());
  getIt.registerLazySingleton(() => KeysRepository());
  getIt.registerLazySingleton(() => LocalNotificationService());
  getIt<LocalNotificationService>().init();

  await getIt<SplashRepository>().openBox();
  await getIt<KeysRepository>().openBox();
  await getIt<TaskRepository>().openBox("2023-04-21");



}