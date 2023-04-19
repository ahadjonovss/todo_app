
import 'package:todo_app/utils/tools/file_importer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: Column(
          children:   [
            const CustomAppBar(),
            Container(
              width: width(context),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Today",style: AppTextStyles.headlineMedium(context),),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      ...List.generate(5, (index) => TaskItem())
                    ],
                  )
                ],
              ),
            )

      ],
    ),
    ),
    );
  }
}
