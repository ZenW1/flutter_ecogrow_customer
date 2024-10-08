part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();
}

final class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  final CartListResponseModel data;
  CartLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class CartFailed extends CartState {
  final String message;
  CartFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class CartIncrease extends CartState {
  final int count;

  CartIncrease({required this.count});

  @override
  List<Object> get props => [count];
}

class CartSuccess extends CartState {
  final String message;
  CartSuccess({required this.message});

  @override
  List<Object> get props => [message];
}
