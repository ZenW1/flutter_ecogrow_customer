import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState.home);

  int get selectedIndex => state.tabIndex;



  void setTabIndex(int index) {
    emit(MainState.values[index]);
  }
}
