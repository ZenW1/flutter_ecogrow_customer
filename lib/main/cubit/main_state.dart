part of 'main_cubit.dart';

enum MainState {
  home,
  category,
  cart,
  order,
  profile,
}

extension MainStateExtension on MainState {
  int get tabIndex {
    switch (this) {
      case MainState.home:
        return 0;
      case MainState.category:
        return 1;
      case MainState.cart:
        return 2;
      case MainState.order:
        return 3;
      case MainState.profile:
        return 4;
    }
  }
}
