import 'package:todo_app/utils/tools/file_importer.dart';


class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        getIt<SplashRepository>().register();
        Navigator.pushNamedAndRemoveUntil(context, RouteName.main, (route) => false);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: width(context)*0.15),
        height: height(context)*0.07,
        width: width(context),
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                colors: [
                  AppColors.c5DE61A,
                  AppColors.c39A801,
                ]
            )
        ),
        child: Text("Get Started",style: AppTextStyles.headlineMedium(context,color: Colors.white),),
      ),
    );
  }
}
