import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());

  int get selectedIndex => state.selectedIndex;
  bool get isHomeSelected => state.selectedIndex == 0;

  void selectIndex(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void setTabIndex(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
