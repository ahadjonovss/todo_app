import 'package:todo_app/utils/tools/file_importer.dart';

class ChooseDateItem extends StatelessWidget {
  dynamic state;
  ChooseDateItem({this.state,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskBloc, AddTaskState>(
      builder: (context, state) {
        return SizedBox(
          width: width(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Choose date", textAlign: TextAlign.start,
                  style: AppTextStyles.headlineMedium(
                      context, fontSize: 16.h, color: AppColors.c404040)),
              SizedBox(height: height(context)*0.01,),
              ZoomTapAnimation(
                  onTap: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((value) =>
                        context.read<AddTaskBloc>().add(
                            UpdateTaskInformationEvent(time: value)));
                  },
                  child:  Text("Today, ${getTime(state.newTask.time)}",style: AppTextStyles.headlineMediumBold(context,fontWeight: FontWeight.w700,fontSize: 18),))
            ],
          ),
        );
      },
    );
  }
}
