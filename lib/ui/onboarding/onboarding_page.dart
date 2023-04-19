

import 'package:todo_app/utils/constants/app_colors.dart';
import 'package:todo_app/utils/constants/app_text_styles.dart';
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
            Image.asset(AppImages.appLogo,width: width(context)*0.5,),
            Text("Reminders made simple",style: AppTextStyles.headlineLarge(context),),


          ],
        ),
      ),
    );
  }
}
