part of 'checkout_cubit.dart';

class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object> get props => [];
}

class CheckoutInitial extends CheckoutState {
  @override
  List<Object> get props => [];
}


class CheckoutLoading extends CheckoutState {
  @override
  List<Object> get props => [];
}

class CheckoutSuccess extends CheckoutState {
  final String message;
   const CheckoutSuccess({required this.message});

  @override
  List<Object> get props => [message];
}


class CheckoutFailed extends CheckoutState {
  final String message;
  const CheckoutFailed({required this.message});

  @override
  List<Object> get props => [message];
}