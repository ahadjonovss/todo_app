import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/utils/tools/file_importer.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;
  TaskItem({required this.task,Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    CategoryModel category = detectCategory(task.category);
    return Slidable(
      key:  ValueKey(task.id),
      endActionPane:  ActionPane(
        extentRatio: 0.3,
        motion: const ScrollMotion(),
        children: [
         SizedBox(width: width(context)*0.04,),
          ZoomTapAnimation(
            onTap: () {
              TextEditingController controller = TextEditingController();
              controller.text=task.title;
              context.read<UpdateTaskBloc>().add(UpdateTaskInfoEvent(
                time: task.time,
                boxName: task.boxName,
                id: task.id,
                title: task.title,
                type: task.category,));
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isDismissible: false,
                  enableDrag: true,
                  isScrollControlled: true,
                  constraints: BoxConstraints(
                      minHeight: height(context)*0.55
                  ),
                  context: context, builder: (context) => Padding(
                padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child:  UpdateTaskBottomSheet(task: task,controller: controller),
              ));
            },
            child: Container(
              height: height(context)*0.05,
              alignment: Alignment.center,
              width: height(context)*0.05,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFC4CEF5)
              ),
              child: SvgPicture.asset(AppIcons.edit,fit: BoxFit.cover,),
            ),
          ),
          SizedBox(width: width(context)*0.01,),
          ZoomTapAnimation(
            onTap: () {
              showCupertinoDialog(context: context, builder: (context) => CustomDialog(
                  title: "Are you sure to delete this task?", onYesTapped: () {
                    context.read<TasksBloc>().add(DeleteTaskEvent(task));

                  }, task: task.title),);
            },
            child: Container(
              height: height(context)*0.05,
              alignment: Alignment.center,
              width: height(context)*0.05,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFCFCF)
              ),
              child: SvgPicture.asset(AppIcons.delete,fit: BoxFit.cover,),
            ),
          ),
        ],
      ),
      child: ZoomTapAnimation(
        onTap: () {
          showCupertinoDialog(context: context, builder: (context) => CustomDialog(task: task.title,title: task.isFinished?"Have not finished this task?":"Have you finished this task?",onYesTapped: () {
            context.read<TasksBloc>().add(UpdateCurrentTaskEvent(task.copyWith(isFinished: task.isFinished?false:true)));
          },),);
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: Container(
            margin: EdgeInsets.only(top: 16.h),
            constraints: BoxConstraints(
              minHeight: height(context)*0.07
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
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
                      SizedBox(
                        width: width(context)*0.6,
                          child: Text(task.title,style: AppTextStyles.headlineLarge(context,color: AppColors.c554E8F,fontWeight: FontWeight.w600,fontSize: 16.h),)),

                    ],
                  ),
                ),
                ZoomTapAnimation(
                  onTap: () {
                    showCupertinoDialog(context: context, builder: (context) => CustomDialog(title: task.mustNotify?"Are you going to turn off notification for this task?":"Are you going to turn on notification for this task?", onYesTapped: () {
                      context.read<TasksBloc>().add(UpdateCurrentTaskEvent(task.copyWith(mustNotify: task.mustNotify?false:true)));
                    }, task: task.title));
                  },
                    child: SvgPicture.asset(task.mustNotify?AppIcons.notificationOn:AppIcons.notificationOff,width: 20.h))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
