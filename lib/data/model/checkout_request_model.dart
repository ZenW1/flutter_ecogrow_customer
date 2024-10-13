// To parse this JSON data, do
//
//     final checkoutRequestModel = checkoutRequestModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'checkout_request_model.g.dart';


@JsonSerializable()
class CheckoutRequestModel {
  @JsonKey(name: "latitude")
  final double? latitude;
  @JsonKey(name: "longitude")
  final double? longitude;
  @JsonKey(name: "seller_id")
  final int? sellerId;
  @JsonKey(name: "discount")
  final int? discount;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "payment_id")
  final int? paymentId;
  @JsonKey(name: "order_detail")
  final List<OrderDetail>? orderDetail;
  @JsonKey(name: "grand_total")
  final int? grandTotal;

  CheckoutRequestModel({
    this.latitude,
    this.longitude,
    this.sellerId,
    this.discount,
    this.description,
    this.paymentId,
    this.orderDetail,
    this.grandTotal,
  });

  factory CheckoutRequestModel.fromJson(Map<String, dynamic> json) => _$CheckoutRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutRequestModelToJson(this);
}

@JsonSerializable()
class OrderDetail {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "product_id")
  final int? productId;
  @JsonKey(name: "unit_type_id")
  final int? unitTypeId;
  @JsonKey(name: "base_qty")
  final int? baseQty;
  @JsonKey(name: "order_qty")
  final int? orderQty;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "sub_total")
  final int? subTotal;

  OrderDetail({
    this.id,
    this.productId,
    this.unitTypeId,
    this.baseQty,
    this.orderQty,
    this.price,
    this.subTotal,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => _$OrderDetailFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailToJson(this);
}
