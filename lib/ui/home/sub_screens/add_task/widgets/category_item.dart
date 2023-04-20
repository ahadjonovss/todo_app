import 'package:todo_app/utils/tools/file_importer.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const  EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: categories[0].color,
          borderRadius: BorderRadius.circular(4)
      ),
      child: Row(
        children: [
          PhysicalModel(
            shape: BoxShape.circle,
            color: categories[0].color,
            child: const SizedBox(
              height: 10.0,
              width: 10.0,
            ),



          ),
          Text(categories[0].title,style: AppTextStyles.headlineSmall(context,color: Colors.grey,fontSize: 16),)
        ],
      ),
    );
  }
}
