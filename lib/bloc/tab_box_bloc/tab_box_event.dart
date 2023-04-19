part of 'tab_box_bloc.dart';

@immutable
abstract class TabBoxEvent {}

class ChangeIndexEvent extends TabBoxEvent{
  int index;

  ChangeIndexEvent(this.index);
}
