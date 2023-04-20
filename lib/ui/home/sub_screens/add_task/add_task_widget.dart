import 'package:todo_app/utils/tools/file_importer.dart';

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskBloc(),
      child: BlocBuilder<AddTaskBloc, AddTaskState>(
        builder: (context, state) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              CustomPaint(
                size: Size(width(context), width(context)),
                painter: MyPainter(),
              ),
              Positioned(
                top: 120,
                child: Container(
                  height: height(context) * 0.8,
                  width: width(context),
                  color: Colors.white),
              ),
              Positioned(
                top: 16,
                right: 10,
                left: 10,
                child: Column(
                  children: [
                    const CustomCloseButton(),
                    SizedBox(height: height(context) * 0.01),
                    Text("Add new task",
                      style: AppTextStyles.headlineMedium(context, fontSize: 16.h, color: AppColors.c404040)),
                    SizedBox(height: height(context) * 0.02),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: width(context),
                        child: TextField(
                          style: AppTextStyles.headlineLarge(context,
                              color: AppColors.c373737),
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: "Type..."))),
                    SizedBox(height: height(context) * 0.01),
                    const Divider(color: AppColors.cCFCFCF),
                    const CategoriesView(),
                    const Divider(color: AppColors.cCFCFCF),
                    SizedBox(height: height(context) * 0.02),
                    const ChooseDateItem(),
                    SizedBox(height: height(context) * 0.05),
                    GlobalButton(title: "Add task", onTap:() {
                    }, gradient:const  [
                      AppColors.c7EB6FF,
                      AppColors.c5F87E7,
                    ])

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
