import 'package:todo_app/utils/tools/file_importer.dart';

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskBloc(),
      child: BlocConsumer<AddTaskBloc, AddTaskState>(
        listener: (context, state) {
          if(state.status==FormStatus.success){
            Navigator.pop(context);
          }else if(state.status==FormStatus.fail){
            AnimatedSnackBar.material(
              'Fill all fields!',
              type: AnimatedSnackBarType.error,
              mobileSnackBarPosition: MobileSnackBarPosition.top,
              desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
            ).show(context);
          }
        },
        builder: (context, state) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              CustomPaint(
                size: Size(width(context), width(context)),
                painter: MyPainter()),
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
                child: SingleChildScrollView(
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
                            onChanged: (value) {
                              context.read<AddTaskBloc>().add(UpdateTaskInformationEvent(title: value));
                            },
                            style: AppTextStyles.headlineLarge(context,
                                color: AppColors.c373737),
                            decoration: const InputDecoration(
                                border: InputBorder.none, hintText: "Type..."))),
                      SizedBox(height: height(context) * 0.01),
                      const Divider(color: AppColors.cCFCFCF),
                      CategoriesView(isUpdate: false,state: state,),
                      const Divider(color: AppColors.cCFCFCF),
                      SizedBox(height: height(context) * 0.02),
                      ChooseDateItem(state: state,isUpdate: false),
                      SizedBox(height: height(context) * 0.06),
                      GlobalButton(title: "Add task", onTap:() {
                        context.read<AddTaskBloc>().add(AddCurrentTaskEvent());
                        context.read<TasksBloc>().add(GetAllTasks());

                      }, gradient:const  [
                        AppColors.c7EB6FF,
                        AppColors.c5F87E7,
                      ])

                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
