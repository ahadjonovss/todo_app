import 'package:todo_app/utils/tools/file_importer.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment.center,
        height: height(context)*0.06,
        width: height(context)*0.06,
        decoration:const  BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.cF857C3
        ),
        child: const Icon(Icons.close,color: Colors.white,),
      ),
    );
  }
}
