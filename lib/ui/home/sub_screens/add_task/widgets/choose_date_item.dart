import 'package:todo_app/utils/tools/file_importer.dart';

class ChooseDateItem extends StatelessWidget {
  const ChooseDateItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Choose date",textAlign: TextAlign.start,
              style: AppTextStyles.headlineMedium(context, fontSize: 16.h, color: AppColors.c404040)),
          ZoomTapAnimation(
            onTap: () {
              showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
              ).then((value) => context.read<AddTaskBloc>().add(UpdateTaskEvent(time: value)));
            },
              child: const Text("some"))
        ],
      ),
    );
  }
}
