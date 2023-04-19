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
          children: [
            Container(
              height: height(context)*0.3,
              width: width(context),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors:[
                    AppColors.c81C7F5,
                    AppColors.c3867D5,
                  ]
                )
              ),
              child: Stack(
                children: [
                  Image.asset(AppImages.corner1,width: 130.h,),
                  Positioned(
                    right: 0,
                      child: Image.asset(AppImages.corner2,width: 80.h)),
                  Positioned(
                    top: 80.h,
                      left: 20.h,
                      right: 20.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello",style: AppTextStyles.headlineMedium(context,color: Colors.white,fontSize: 22),),
                      Text("Today you have 9 tasks",style: AppTextStyles.headlineMedium(context,color: Colors.white,fontSize: 18),),
                      SizedBox(height: height(context)*0.02,),
                      Container(
                        height: height(context)*0.12,
                        width: width(context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.31)

                        ),
                      )
                    ],
                  )),



                ]
            )
        ),
      ],
    ),
    ),
    );
  }
}
