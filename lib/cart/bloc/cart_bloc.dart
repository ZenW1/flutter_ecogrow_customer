import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecogrow_customer/data/model/cart_list_response_model.dart';
import 'package:flutter_ecogrow_customer/data/repo/cart_repo.dart';
import 'package:flutter_ecogrow_customer/data/service/local_storage_service.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepo repo;
  CartBloc(this.repo) : super(CartInitial()) {
    on<CartFetchEvent>(_fetchCart);
    on<CartIncreaseEvent>(_increaseQuantityCart);
    on<CartAddEvent>(_addCart);
  }

  late CartListResponseModel cartListResponseModel;
  List<bool> isSelected = [];
  bool isSelectedStore = false;
  int cartCount = 0;

  Future<void> _fetchCart(CartFetchEvent event, Emitter<CartState> emit) async {
    emit(CartInitial());
    try {
      final res = await LocalStorageService.getObject(AppConstant.cartKey);

      log('CartBloc _fetchCart $res');
      // cartListResponseModel = CartListResponseModel.fromJson(jsonDecode(res));
      emit(CartLoaded(data: res as CartListResponseModel));
    } catch (e) {
      emit(CartFailed(message: e.toString()));
    }
  }

  Future<void> _addCart(CartAddEvent event, Emitter<CartState> emit) async {
    emit(CartInitial());
    try {
      await LocalStorageService.storeObject(
          AppConstant.cartKey, event.cartModel);
      emit(CartSuccess(message: 'Product added to cart'));
    } catch (e) {
      emit(CartFailed(message: e.toString()));
    }
  }

  Future<void> _increaseQuantityCart(
      CartIncreaseEvent event, Emitter<CartState> emit) async {
    // emit(CartInitial());
    try {
      cartCount = int.parse(cartListResponseModel
          .items![event.index].products![event.index].quantity!);
      cartCount++;
      emit(CartIncrease(count: cartCount));
    } catch (e) {
      emit(CartFailed(message: e.toString()));
    }
  }
}
