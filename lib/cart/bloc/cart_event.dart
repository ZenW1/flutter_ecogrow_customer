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

class CartIncreaseEvent extends CartEvent {
  final int value;
  final int index;

  CartIncreaseEvent({required this.value, required this.index});

  @override
  List<Object> get props => [value, index];
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
