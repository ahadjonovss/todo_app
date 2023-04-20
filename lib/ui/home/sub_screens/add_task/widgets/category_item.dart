import 'package:todo_app/utils/tools/file_importer.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel category;
  bool isSelected;
  CategoryItem({required this.isSelected,required this.category,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const  Duration(seconds: 1),
      margin: const EdgeInsets.only(right: 6),
      padding:const  EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: isSelected?category.color:Colors.transparent,
          borderRadius: BorderRadius.circular(4)
      ),
      child: Row(
        children: [
          if(!isSelected)
          PhysicalModel(
            shape: BoxShape.circle,
            color: category.color,
            child: const SizedBox(
              height: 10.0,
              width: 10.0,
            ),
          ),
          if(!isSelected)
            const SizedBox(width: 8,),
          Text(category.title,style: AppTextStyles.headlineSmall(context,color: isSelected?Colors.white:Colors.grey,fontSize: 16),)
        ],
      ),
    );
  }
}
