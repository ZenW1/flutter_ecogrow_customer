import 'package:flutter_ecogrow_customer/data/model/store_model.dart';

class OrderItemModel {
  const OrderItemModel({
    required this.id,
    required this.dateTime,
    required this.totalPrice,
    required this.qty,
    required this.store,
  });
  final String id;
  final String dateTime;
  final String totalPrice;
  final String qty;
  final StoreModel store;
}
