// To parse this JSON data, do
//
//     final orderDetailResponseModel = orderDetailResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'order_detail_response_model.g.dart';

@JsonSerializable()
class OrderDetailResponseModel {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<OrderDetailModel>? data;

  OrderDetailResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory OrderDetailResponseModel.fromJson(Map<String, dynamic> json) => _$OrderDetailResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailResponseModelToJson(this);
}

@JsonSerializable()
class OrderDetailModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "order_code")
  final String? orderCode;
  @JsonKey(name: "order_status_id")
  final int? orderStatusId;
  @JsonKey(name: "order_status_name")
  final String? orderStatusName;
  @JsonKey(name: "seller_id")
  final int? sellerId;
  @JsonKey(name: "seller_name")
  final String? sellerName;
  @JsonKey(name: "customer_id")
  final int? customerId;
  @JsonKey(name: "store_name")
  final String? storeName;
  @JsonKey(name: "customer_name")
  final String? customerName;
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  @JsonKey(name: "latitude")
  final String? latitude;
  @JsonKey(name: "longitude")
  final String? longitude;
  @JsonKey(name: "discount")
  final int? discount;
  @JsonKey(name: "grand_total")
  final int? grandTotal;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "order_date")
  final DateTime? orderDate;
  @JsonKey(name: "payment_method_id")
  final int? paymentMethodId;
  @JsonKey(name: "payment_method")
  final String? paymentMethod;
  @JsonKey(name: "get_order_detail")
  final List<GetOrderDetail>? getOrderDetail;

  OrderDetailModel({
    this.id,
    this.orderCode,
    this.orderStatusId,
    this.orderStatusName,
    this.sellerId,
    this.sellerName,
    this.customerId,
    this.storeName,
    this.customerName,
    this.phoneNumber,
    this.latitude,
    this.longitude,
    this.discount,
    this.grandTotal,
    this.description,
    this.orderDate,
    this.paymentMethodId,
    this.paymentMethod,
    this.getOrderDetail,
  });

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) => _$OrderDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailModelToJson(this);
}

@JsonSerializable()
class GetOrderDetail {
  @JsonKey(name: "order_id")
  final int? orderId;
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "product_id")
  final int? productId;
  @JsonKey(name: "product_name")
  final String? productName;
  @JsonKey(name: "unit_type_id")
  final int? unitTypeId;
  @JsonKey(name: "unit_type_name")
  final String? unitTypeName;
  @JsonKey(name: "qty")
  final int? qty;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "total_price")
  final int? totalPrice;
  @JsonKey(name: "product_image")
  final String? productImage;

  GetOrderDetail({
    this.orderId,
    this.id,
    this.productId,
    this.productName,
    this.unitTypeId,
    this.unitTypeName,
    this.qty,
    this.price,
    this.totalPrice,
    this.productImage,
  });

  factory GetOrderDetail.fromJson(Map<String, dynamic> json) => _$GetOrderDetailFromJson(json);

  Map<String, dynamic> toJson() => _$GetOrderDetailToJson(this);
}
