import 'package:bloc/bloc.dart';
import 'package:flutter_ecogrow_customer/cart/bloc/cart_bloc.dart';
import 'package:flutter_ecogrow_customer/cart/cart.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit(this.cartBloc) : super(MainState.home);

  CartBloc cartBloc;


  int get selectedIndex => state.tabIndex;

  void setTabIndex(int index) {
    emit(MainState.values[index]);
    if (index == 2) {
      cartBloc..add(CartFetchEvent());
    }
  }
}
