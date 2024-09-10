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

  List<OrderItemModel> data;

  @override
  List<Object> get props => [data];
}

class OrderFailure extends OrderState {
  const OrderFailure();

  @override
  List<Object> get props => [];
}
