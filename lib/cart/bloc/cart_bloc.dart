import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/data/model/cart_list_response_model.dart';
import 'package:flutter_ecogrow_customer/data/repo/cart_repo.dart';
import 'package:flutter_ecogrow_customer/data/service/cart_service.dart';
import 'package:flutter_ecogrow_customer/data/service/local_storage_service.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:flutter_ecogrow_customer/shared/widget/dialog.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepo repo;

  // final CartRepository cartRepository;

  CartBloc(this.repo,) : super(CartInitial()) {
    on<CartFetchEvent>(_fetchCart);
    on<CartDeleteEvent>(_deleteCart);
    on<CartAddEvent>(_addCart);
    on<CartUpdateQuantity>(_updateCart);
    on<CartDeleteAutoEvent>(_deleteCartAuto);
    on<CartDeleteProductAtIndex>(_deleteProductAtIndex);
    on<CartClearEvent>(_clearCart);
  }

  Future<void> _fetchCart(CartFetchEvent event, Emitter<CartState> emit) async {
    emit(CartInitial());
    try {
      final res = CartRepository.getCartData();

      log('CartBloc _fetchCart ${res?.toJson()}');
      log('CartBloc _fetchCart ${jsonEncode(res!.items.toString())}');

      emit(CartLoaded(data: res));
    } catch (e) {
      emit(CartFailed(message: e.toString()));
    }
  }

  Future<void> _addCart(CartAddEvent event, Emitter<CartState> emit) async {
    emit(CartInitial());
    try {
      //   final res = CartRepository.getCartData();
      //   if (res!.items!.isNotEmpty) {
      //     AppDialog.questionDialog(
      //       context,
      //       content: 'Are you sure , logging out . Your carts item will be deleted',
      //       onYes: () {
      //         CartRepository.clearCart();
      //         emit(CartSuccess(message: 'Product added to cart'));
      //       },
      //     );
      //   } else {
      //
      //   }
      // }
    CartRepository.addCartModelByStoreId(event.cartModel);
    emit(CartSuccess(message: 'Product added to cart'));
    } catch (e) {
      emit(CartFailed(message: e.toString()));
    }
  }

  Future<void> _deleteCart(CartDeleteEvent event, Emitter<CartState> emit) async {
    // emit(CartInitial());
    log('CartBloc _deleteCart ${event.index}');

    CartRepository.deleteAtIndex(event.index);

    emit(CartSuccess(message: 'Product deleted from cart'));
  }

  Future<void> _updateCart(CartUpdateQuantity event, Emitter<CartState> emit) async {
    // emit(CartInitial());
    log('CartBloc _updateCart ${event.index}');

    CartRepository.updateQuantity(index: event.index, secondIndex: event.secondIndex, quantity: event.quantity);

    emit(CartSuccess(message: 'Product quantity updated'));
  }

  Future<void> _deleteCartAuto(CartDeleteAutoEvent event, Emitter<CartState> emit) async {
    emit(CartInitial());
    CartRepository.deleteExpiredProduct();
    emit(CartSuccess(message: 'Cart deleted'));
  }

  Future<void> _deleteProductAtIndex(CartDeleteProductAtIndex event, Emitter<CartState> emit) async {
    emit(CartInitial());
    CartRepository.deleteProductAtIndex(index: event.index, secondIndex: event.secondIndex);
    emit(CartSuccess(message: 'Product deleted'));
  }

  Future<void> _clearCart(CartClearEvent event, Emitter<CartState> emit) async {
    emit(CartInitial());
    CartRepository.clearCart();
    emit(CartSuccess(message: 'Cart cleared'));
  }

// Future<void> _increaseQuantityCart(
//     CartIncreaseEvent event, Emitter<CartState> emit) async {
//   emit(CartInitial());
//   try {
//     cartCount = int.parse(cartListResponseModel.items![event.index].products![event.index].quantity!);
//     cartCount++;
//     emit(CartIncrease(count: cartCount));
//   } catch (e) {
//     emit(CartFailed(message: e.toString()));
//   }
// }
}
