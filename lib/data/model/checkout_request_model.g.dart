// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutRequestModel _$CheckoutRequestModelFromJson(
        Map<String, dynamic> json) =>
    CheckoutRequestModel(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      sellerId: (json['seller_id'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      description: json['description'] as String?,
      paymentId: (json['payment_id'] as num?)?.toInt(),
      orderDetail: (json['order_detail'] as List<dynamic>?)
          ?.map((e) => OrderDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      grandTotal: (json['grand_total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CheckoutRequestModelToJson(
        CheckoutRequestModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'seller_id': instance.sellerId,
      'discount': instance.discount,
      'description': instance.description,
      'payment_id': instance.paymentId,
      'order_detail': instance.orderDetail,
      'grand_total': instance.grandTotal,
    };

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) => OrderDetail(
      id: (json['id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      unitTypeId: (json['unit_type_id'] as num?)?.toInt(),
      baseQty: (json['base_qty'] as num?)?.toInt(),
      orderQty: (json['order_qty'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      subTotal: (json['sub_total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderDetailToJson(OrderDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'unit_type_id': instance.unitTypeId,
      'base_qty': instance.baseQty,
      'order_qty': instance.orderQty,
      'price': instance.price,
      'sub_total': instance.subTotal,
    };
