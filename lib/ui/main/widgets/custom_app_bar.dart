import 'package:todo_app/utils/tools/file_importer.dart';

class CustomAppBar extends StatelessWidget {
  List<TaskModel> tasks;
  String? title;
  CustomAppBar({this.title,required this.tasks,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
        curve: Curves.linearToEaseOut,
        height: context.read<TasksBloc>().state.needShowTaskBar && tasks.isNotEmpty?height(context)*0.3:height(context)*0.15,
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
                      Text(title??"Today you have ${tasks.length} tasks",style: AppTextStyles.headlineMedium(context,color: Colors.white,fontSize: 18),),
                      SizedBox(height: height(context)*0.02,),
                      if(context.read<TasksBloc>().state.needShowTaskBar && tasks.isNotEmpty)
                        Container(
                          height: height(context)*0.12,
                          width: width(context),
                          padding: EdgeInsets.all(20.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.31)

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Today Reminder",style: AppTextStyles.headlineLarge(context,color: Colors.white),),
                                  Text(tasks[0].title,style: AppTextStyles.headlineMediumBold(context,color: Colors.white),),
                                  Text("At ${getTime(tasks[0].time)}",style: AppTextStyles.headlineSmall(context,color: Colors.white),),

                                ],
                              ),
                              Stack(
                                children: [
                                  SvgPicture.asset(AppIcons.bell),
                                  Positioned(
                                    right: 0,
                                    child: ZoomTapAnimation(
                                        onTap: () {
                                          context.read<TasksBloc>().add(CloseReminderBanner());
                                          print("MAnAA");
                                        },
                                        child: SvgPicture.asset(AppIcons.close)),
                                  ),

                                ],
                              )
                            ],
                          )
                      )
                    ],
                  )),



            ]
        )
    );
  }
}
