import 'package:todo_app/utils/tools/file_importer.dart';

class CategoryWidget extends StatelessWidget {
  CategoryModel category;
  CategoryWidget({required this.category,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        Navigator.pushNamed(context, RouteName.tasks,arguments: category);
      },
      child: Container(
        margin: EdgeInsets.all(height(context)*0.02),
        alignment: Alignment.center,
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.h),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              )
            ]
        ),
        height: height(context)*0.2,
        width: height(context)*0.18,
        child: Column(
          children: [
            Container(
              width: height(context)*0.07,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top:  height(context)*0.025),
              height:  height(context)*0.07,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: category.backgroundColor,
              ),
              child: SvgPicture.asset(category.icon),
            ),
            Text(category.title,style: AppTextStyles.headlineMedium(context,fontSize: 17.h,fontWeight: FontWeight.w700),),
            SizedBox(height:  height(context)*0.016,),
            Text("24 tasks",style: AppTextStyles.headlineSmall(context,fontSize: 10.h),),
          ],
        ),
      ),
    );
  }
}
