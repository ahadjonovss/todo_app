import 'package:todo_app/utils/tools/file_importer.dart';

part 'tab_box_event.dart';
part 'tab_box_state.dart';

class TabBoxBloc extends Bloc<ChangeIndexEvent, TabBoxState> {
  TabBoxBloc() : super(TabBoxState(0)) {
    on<ChangeIndexEvent>(changeIndex);
  }

  changeIndex(ChangeIndexEvent event, emit) {
    emit(state.copyWith(event.index));
  }
}
