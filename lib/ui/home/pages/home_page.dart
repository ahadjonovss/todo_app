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
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    child: Container(
                      height: height(context)*0.06,
                      width: width(context),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors.black,
                            width: 3.0,
                          ),
                        ),
                        color: Colors.white
                      ),
                    ),
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
