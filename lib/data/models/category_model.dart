import 'dart:ui';

import 'package:todo_app/utils/tools/file_importer.dart';

class CategoryModel {
  final Color color;
  final Color backgroundColor;
  final String title;
  final String icon;

  CategoryModel(
      {required this.color,
      required this.title,
      required this.backgroundColor,
      required this.icon});
}

List<CategoryModel> categories = [
  CategoryModel(
      color: const Color(0xFFFFD506),
      title: "Personal",
      backgroundColor: const Color(0xFFFFEE9B),
      icon: AppIcons.personal),
  CategoryModel(
      color: const Color(0xFF1ED102),
      title: "Work",
      backgroundColor: const Color(0xFFB5FF9B),
      icon: AppIcons.work),
  CategoryModel(
      color: const Color(0xFFD10263),
      title: "Meeting",
      backgroundColor: const Color(0xFFFF9BCD),
      icon: AppIcons.marketing),
  CategoryModel(
      color: const Color(0xFFF29130),
      title: "Shopping",
      backgroundColor: const Color(0xFFFFD09B),
      icon: AppIcons.shopping),
  CategoryModel(
      color: const Color(0xFF9BFFF8),
      title: "Party",
      backgroundColor: const Color(0xFF9BFFF8),
      icon: AppIcons.party),
  CategoryModel(
      color: const Color(0xFFF857C3),
      title: "Study",
      backgroundColor: const Color(0xFFF59BFF),
      icon: AppIcons.study),
];
