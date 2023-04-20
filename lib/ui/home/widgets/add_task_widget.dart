import 'package:todo_app/utils/tools/file_importer.dart';

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
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
        ),
        Positioned(
          top: 16,
          right: 10,
          left: 10,
          child: ZoomTapAnimation(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: height(context)*0.06,
              width: height(context)*0.06,
              padding: const EdgeInsets.all(16),
              decoration:const  BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.cF857C3
              ),
              child: const Icon(Icons.close,color: Colors.white,),
            ),
          ),
        )
      ],
    );
  }
}
