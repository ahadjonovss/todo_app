import 'package:todo_app/ui/home/widgets/arc.dart';
import 'package:todo_app/utils/tools/file_importer.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List pages = [
      HomePage(),
      TasksPage()
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context, builder: (context) => Stack(
            clipBehavior: Clip.none,
            children: [
              CustomPaint( //                       <-- CustomPaint widget
              size: Size(width(context), width(context)),
            painter: MyPainter(),
          ),
              Positioned(
                top: 120,
                child: Container(
                  height: width(context)*0.7,
                  width: width(context),
                  color: Colors.white,
                ),
              )
            ],
          ));

        },
        backgroundColor: AppColors.cF857C3,
        child: const Icon(Icons.add,color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: BlocBuilder<TabBoxBloc,TabBoxState>(
        builder: (context, state) => pages[state.index],
      ),
      bottomNavigationBar: AppNavigationBar(),
    );
  }
}
