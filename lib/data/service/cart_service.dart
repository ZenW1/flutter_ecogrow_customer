import 'dart:developer';
import 'dart:io';

import 'package:flutter_ecogrow_customer/data/model/cart_list_response_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';



class CartRepository {

  CartRepository._();

  static final CartRepository _instance = CartRepository._();

 static Box<CartListResponseModel>? _cartBox;

  static Future<void> openCartBox() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(
      Directory(appDocumentDirectory.path).path,
    );
    _cartBox = await Hive.openBox<CartListResponseModel>('cart');
  }


  static CartListResponseModel? getCartData() {
    var cartData = _cartBox!.get('cart');

    log('getCartData(${cartData?.items})');
    log('getCartData(${cartData?.toJson()})');


    if (cartData == null) {
      cartData = CartListResponseModel(items: []);
      _cartBox!.put('cart', cartData);
    }
    return cartData;
  }


  static void addCartModel(CartModel newCartModel) {
    final cartData = getCartData();
    cartData!.items!.add(newCartModel);

    log('addCartModel(${cartData.items})');

    log('addCartModel(${cartData.toJson()})');

    _cartBox!.put('cart', cartData);
  }

  // add cart to model that have the same store id

  static void addCartModelByStoreId(CartModel newCartModel) {
    final cartData = getCartData();
    final index = cartData!.items!.indexWhere((element) => element.storeId == newCartModel.storeId);
    if (index != -1) {
      cartData.items![index].products!.addAll(newCartModel.products!);
    } else {
      cartData.items!.add(newCartModel);
    }

    log('addCartModelByStoreId(${cartData.items})');

    _cartBox!.put('cart', cartData);
  }

  // update at index

  static void updateAtIndex(int index, CartModel newCartModel) {
    final cartData = getCartData();
    cartData!.items![index] = newCartModel;

    log('updateAtIndex($index, ${cartData.items})');

    _cartBox!.put('cart', cartData);
  }

  // update by quantity
  static void updateQuantity({required int index, required int secondIndex, required int quantity}) {
    final cartData = getCartData();
    final quantity = cartData!.items![index].products![secondIndex].quantity!;
    cartData.items![index].products![secondIndex].quantity = quantity;
    log('quantity: $quantity');

    log('updateQuantity($index, ${cartData.items})');

    _cartBox!.put('cart', cartData);
  }


  static void deleteAtIndex(int index) {
    final cartData = getCartData();
    cartData!.items!.removeAt(index);

    log('deleteAtIndex($index, ${cartData.items})');

    _cartBox!.put('cart', cartData);
  }

  static void deleteProductAtIndex({required int index, required int secondIndex}) {
    final cartData = getCartData();
    cartData!.items![index].products!.removeAt(secondIndex);

    if(cartData!.items![index].products!.isEmpty){
      cartData.items!.removeAt(index);
    }

    log('deleteProductAtIndex($index, ${cartData.items})');

    _cartBox!.put('cart', cartData);
  }

  static void clearCart() {
    _cartBox!.delete('cart');
  }

  // product expire date automatically delete
  static void deleteExpiredProduct() {
    final cartData = getCartData();
    cartData!.items!.removeWhere((element) => element.products!.any((element) => element.expiredOn!.isBefore(DateTime.now())));

    log('deleteExpiredProduct(${cartData.items})');

    _cartBox!.put('cart', cartData);
  }



}