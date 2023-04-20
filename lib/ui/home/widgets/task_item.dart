import 'package:todo_app/utils/tools/assistants.dart';
import 'package:todo_app/utils/tools/file_importer.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;
  TaskItem({required this.task,Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    CategoryModel category = detectCategory(task.category);
    return ClipRRect(
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
            Container(
              height: height(context)*0.024,
              width: height(context)*0.024,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.grey
                  )
              ),
            ),
            Text(getTime(task.time),style: AppTextStyles.headlineSmall(context,color: Colors.grey,fontSize: 14),),
            SizedBox(
              width: width(context)*0.5,
              child: Text(task.title,style: AppTextStyles.headlineLarge(context,color: AppColors.c554E8F,fontWeight: FontWeight.w600,fontSize: 16),),
            ),
            SvgPicture.asset(AppIcons.notificationOff,width: 20.h,)
          ],
        ),
      ),
    );
  }
}
