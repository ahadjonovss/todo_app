import 'package:todo_app/utils/tools/file_importer.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            SizedBox(height: height(context)*0.1,),
            Image.asset(AppImages.appLogo,width: width(context)*0.5,),
            Text("Reminders made simple",style: AppTextStyles.headlineLarge(context),),
            SizedBox(height: height(context)*0.2,),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: width(context)*0.15),
               child: GlobalButton(
                onTap: () {
                  getIt<SplashRepository>().register();
                  Navigator.pushNamedAndRemoveUntil(context, RouteName.main, (route) => false);
                },
                title: "Get Started",
                gradient:  const [
                  AppColors.c5DE61A,
                  AppColors.c39A801,
                ],
            ),
             )
          ],
        ),
      ),
    );
  }
}
