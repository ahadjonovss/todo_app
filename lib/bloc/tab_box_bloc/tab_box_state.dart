part of 'tab_box_bloc.dart';

@immutable
class TabBoxState extends Equatable{
  int index;

  TabBoxState(this.index);

  copyWith(int? index)=>TabBoxState(index??this.index);

  @override
  List<Object?> get props => [index];


}

