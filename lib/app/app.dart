import 'package:todo_app/bloc/update_task_bloc/update_task_bloc.dart';
import 'package:todo_app/utils/tools/file_importer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TabBoxBloc(),),
        BlocProvider(create: (context) => AddTaskBloc(),),
        BlocProvider(create: (context) => UpdateTaskBloc(),),
        BlocProvider(create: (context) => TasksBloc()..add(GetAllTasks()),),

      ],
        child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return const MaterialApp(
          initialRoute: RouteName.splash,
          onGenerateRoute: AppRoutes.generateRoute,
          debugShowCheckedModeBanner: false,

          title: 'ToDo App',
        );
      },

    );
  }
}