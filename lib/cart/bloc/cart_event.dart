part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();
}

class CartFetchEvent extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartAddEvent extends CartEvent {
  final CartModel cartModel;

  CartAddEvent({required this.cartModel});

  @override
  List<Object> get props => [cartModel];
}

class CartUpdateEvent extends CartEvent {
  final int index;
  final CartModel cartModel;

  CartUpdateEvent({required this.cartModel,required this.index});

  @override
  List<Object> get props => [cartModel,index];
}

class CartUpdateQuantity extends CartEvent {
   int secondIndex;
   int index;
   int quantity;


  CartUpdateQuantity({required this.secondIndex, required this.index,required this.quantity});

  @override
  List<Object> get props => [secondIndex, index,quantity];
}

class CartDecreaseEvent extends CartEvent {
  final int value;
  final int index;

  CartDecreaseEvent({required this.value, required this.index});

  @override
  List<Object> get props => [value, index];
}

class CartDeleteEvent extends CartEvent {
  final int index;

  CartDeleteEvent({required this.index});

  @override
  List<Object> get props => [index];
}

class CartDeleteAutoEvent extends CartEvent {
  CartDeleteAutoEvent();

  @override
  List<Object> get props => [];
}

class CartDeleteProductAtIndex extends CartEvent {
  final int index;
  final int secondIndex;

  CartDeleteProductAtIndex({required this.index, required this.secondIndex});

  @override
  List<Object> get props => [index, secondIndex];
}

class CartClearEvent extends CartEvent {
  CartClearEvent();

  @override
  List<Object> get props => [];
}
