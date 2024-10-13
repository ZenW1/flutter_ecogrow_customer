part of 'order_cubit.dart';

class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderLoading extends OrderState {
  const OrderLoading();

  @override
  List<Object> get props => [];
}

class OrderLoaded extends OrderState {
  OrderLoaded(this.data);

  OrderDetailResponseModel data;

  @override
  List<Object> get props => [data];
}


class OrderFailure extends OrderState {

  final String message;
  const OrderFailure(this.message);

  @override
  List<Object> get props => [message];
}
