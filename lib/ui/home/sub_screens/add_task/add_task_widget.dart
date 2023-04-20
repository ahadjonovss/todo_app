import 'package:todo_app/utils/tools/file_importer.dart';

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
  create: (context) => AddTaskBloc(),
  child: BlocBuilder<AddTaskBloc, AddTaskState>(
  builder: (context, state) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomPaint( //                       <-- CustomPaint widget
          size: Size(width(context), width(context)),
          painter: MyPainter(),
        ),
        Positioned(
          top: 120,
          child: Container(
            height: width(context)*0.7,
            width: width(context),
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 16,
          right: 10,
          left: 10,
          child: Column(
            children: [
              ZoomTapAnimation(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: height(context)*0.06,
                  width: height(context)*0.06,
                  padding: const EdgeInsets.all(16),
                  decoration:const  BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.cF857C3
                  ),
                  child: const Icon(Icons.close,color: Colors.white,),
                ),
              ),
              SizedBox(height: height(context)*0.01,),
              Text("Add new task",style: AppTextStyles.headlineMedium(context,fontSize: 16.h,color: AppColors.c404040),),
              SizedBox(height: height(context)*0.02,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: width(context),
                  child: TextField(
                    style: AppTextStyles.headlineLarge(context,color: AppColors.c373737),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type..."
                ),
              )),
              SizedBox(height: height(context)*0.02,),
              const Divider(color: AppColors.cCFCFCF,),
              SizedBox(height: height(context)*0.02,),
              SizedBox(
                width: width(context),
                height: width(context)/10,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...List.generate(categories.length, (index) =>
                        ZoomTapAnimation(
                          onTap: () {
                            context.read<AddTaskBloc>().add(UpdateTaskEvent(type: categories[index].title));
                          },
                            child:
                        CategoryItem(category: categories[index],isSelected: state.newTask.category==categories[index].title,)))
                  ],
                ),
              )

            ],
          ),
        )
      ],
    );
  },
),
);
  }
}
