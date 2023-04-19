import 'package:todo_app/utils/constants/app_colors.dart';

import '../tools/file_importer.dart';

class AppTextStyles{

  static TextStyle headlineLarge (context,{Color? color}) => TextStyle(fontFamily: "Rubik",fontWeight: FontWeight.w500,fontSize: 22.sp,color: color??AppColors.c554E8F);
  static TextStyle headlineMedium (context,{Color? color,double? fontSize}) => TextStyle(fontFamily: "Rubik",fontWeight: FontWeight.w400,fontSize: fontSize??18.sp,color: color??AppColors.c554E8F);
  static TextStyle headlineMediumBold (context,{Color? color}) => TextStyle(fontFamily: "Rubik",fontWeight: FontWeight.w500,fontSize: 14.sp,color: color??AppColors.c554E8F);
  static TextStyle headlineSmall (context,{Color? color}) => TextStyle(fontFamily: "Rubik",fontWeight: FontWeight.w400,fontSize: 11.sp,color: color??AppColors.c554E8F);
}