import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecogrow_customer/data/model/order_item_model.dart';
import 'package:flutter_ecogrow_customer/data/model/store_model.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(const OrderState());

  List<OrderItemModel> data = [
    const OrderItemModel(
      id: '1202384754',
      dateTime: '05 Sep 2023 3:30PM',
      totalPrice: '100',
      qty: '1',
      store: StoreModel(
        id: '1',
        storeName: 'Ecogrow Store',
        storeImage: 'https://via.placeholder.com/150',
        storeCategory: 'Fruit Store',
        totalOrder: '15',
      ),
    ),
    const OrderItemModel(
      id: '1202384755',
      dateTime: ' 05 Sep 2023 3:30PM',
      totalPrice: '200',
      qty: '2',
      store: StoreModel(
        id: '2',
        storeName: 'Khmer Store',
        storeImage: 'https://via.placeholder.com/150',
        storeCategory: 'Fruit Store',
        totalOrder: '15',
      ),
    ),
    const OrderItemModel(
      id: '1202384756',
      dateTime: '05 Sep 2023 3:30PM',
      totalPrice: '300',
      qty: '3',
      store: StoreModel(
        id: '3',
        storeName: 'Ecogrow Store',
        storeImage: 'https://via.placeholder.com/150',
        storeCategory: 'Fruit Store',
        totalOrder: '15',
      ),
    ),
    const OrderItemModel(
      id: '1202384757',
      dateTime: '05 Sep 2023 3:30PM',
      totalPrice: '400',
      qty: '4',
      store: StoreModel(
        id: '4',
        storeName: 'Vid Store',
        storeImage: 'https://via.placeholder.com/150',
        storeCategory: 'Fruit Store',
        totalOrder: '15',
      ),
    ),
    const OrderItemModel(
      id: '1202384758',
      dateTime: '05 Sep 2023 3:30PM',
      totalPrice: '500',
      qty: '5',
      store: StoreModel(
        id: '5',
        storeName: 'Ecogrow Store',
        storeImage: 'https://via.placeholder.com/150',
        storeCategory: 'Fruit Store',
        totalOrder: '15',
      ),
    ),
  ];
}
