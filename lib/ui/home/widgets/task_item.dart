import 'package:flutter/cupertino.dart';
import 'package:todo_app/utils/tools/file_importer.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;
  TaskItem({required this.task,Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    CategoryModel category = detectCategory(task.category);
    return ZoomTapAnimation(
      onLongTap: () {
        showCupertinoDialog(context: context, builder: (context) => CustomDialog(task: task.title,title: task.isFinished?"Have not finished this task?":"Have you finished this task?",onYesTapped: () {
          context.read<TasksBloc>().add(UpdateCurrentTaskEvent(task.copyWith(isFinished: task.isFinished?false:true)));
        },),);
      },
      child: CupertinoPopupSurface(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          child: Container(
            margin: EdgeInsets.only(top: 16.h),
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 4,right: 10),
            height: height(context)*0.06,
            width: width(context),
            decoration:  BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: category.color,
                    width: 3.0,
                  ),
                ),
                color: Colors.white
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width(context)*0.9,
                  child: Row(
                    children: [
                      SizedBox(width: width(context)*0.01,),
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        height: height(context)*0.024,
                        width: height(context)*0.024,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: task.isFinished?Colors.green:Colors.grey
                            )
                        ),
                        child: task.isFinished?Image.asset(AppImages.done):null,
                      ),
                      SizedBox(width: width(context)*0.02,),
                      Text(getTime(task.time),style: AppTextStyles.headlineSmall(context,color: Colors.grey,fontSize: 14.h),),
                      SizedBox(width: width(context)*0.02,),
                      Text(task.title,style: AppTextStyles.headlineLarge(context,color: AppColors.c554E8F,fontWeight: FontWeight.w600,fontSize: 16.h),),

                    ],
                  ),
                ),
                ZoomTapAnimation(
                  onTap: () {
                    showCupertinoDialog(context: context, builder: (context) => CustomDialog(title: task.mustNotify?"Are you going to turn off notification for this task?":"Are you going to turn on notification for this task?", onYesTapped: () {
                      context.read<TasksBloc>().add(UpdateCurrentTaskEvent(task.copyWith(mustNotify: task.mustNotify?false:true)));
                    }, task: task.title));
                  },
                    child: SvgPicture.asset(task.mustNotify?AppIcons.notificationOn:AppIcons.notificationOff,width: 20.h,))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
