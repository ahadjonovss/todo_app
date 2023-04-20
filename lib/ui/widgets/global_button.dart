import 'package:todo_app/utils/tools/file_importer.dart';


class GlobalButton extends StatelessWidget {
  VoidCallback onTap;
  String title;
  List<Color> gradient;
  GlobalButton({required this.title,required this.onTap,required this.gradient,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: width(context)*0.15),
        height: height(context)*0.07,
        width: width(context),
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient:  LinearGradient(
                colors:gradient
            )
        ),
        child: Text(title,style: AppTextStyles.headlineMedium(context,color: Colors.white),),
      ),
    );
  }
}
