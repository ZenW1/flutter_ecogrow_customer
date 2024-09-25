import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecogrow_customer/data/model/cart_model.dart';
import 'package:flutter_ecogrow_customer/data/repo/cart_repo.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepo repo;

  CartBloc(this.repo) : super(CartInitial()) {
    on<CartFetchEvent>(_fetchCart);
    on<CartIncreaseEvent>(_increaseQuantityCart);
  }

  late CartListResponseModel cartListResponseModel;
  List<bool> isSelected = [];
  bool isSelectedStore = false;
  int cartCount = 0;

  Future<void> _fetchCart(CartFetchEvent event, Emitter<CartState> emit) async {
    emit(CartInitial());
    try {
      final res = await repo.getCartList();
      cartListResponseModel = res;
      emit(CartLoaded(data: res));
    } catch (e) {
      emit(CartFailed(message: e.toString()));
    }
  }

  Future<void> _increaseQuantityCart(CartIncreaseEvent event, Emitter<CartState> emit) async
  {
    // emit(CartInitial());
    try {
      cartCount = int.parse(cartListResponseModel.items![event.index].products![event.index]!.quantity!);
      cartCount++;
      emit(CartIncrease(count: cartCount));
    }
    catch (e) {
      emit(CartFailed(message: e.toString()));
    }
  }
}