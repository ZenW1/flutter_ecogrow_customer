// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailResponseModel _$OrderDetailResponseModelFromJson(
        Map<String, dynamic> json) =>
    OrderDetailResponseModel(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OrderDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderDetailResponseModelToJson(
        OrderDetailResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

OrderDetailModel _$OrderDetailModelFromJson(Map<String, dynamic> json) =>
    OrderDetailModel(
      id: (json['id'] as num?)?.toInt(),
      orderCode: json['order_code'] as String?,
      orderStatusId: (json['order_status_id'] as num?)?.toInt(),
      orderStatusName: json['order_status_name'] as String?,
      sellerId: (json['seller_id'] as num?)?.toInt(),
      sellerName: json['seller_name'] as String?,
      customerId: (json['customer_id'] as num?)?.toInt(),
      storeName: json['store_name'] as String?,
      customerName: json['customer_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      discount: (json['discount'] as num?)?.toInt(),
      grandTotal: (json['grand_total'] as num?)?.toInt(),
      description: json['description'] as String?,
      orderDate: json['order_date'] == null
          ? null
          : DateTime.parse(json['order_date'] as String),
      paymentMethodId: (json['payment_method_id'] as num?)?.toInt(),
      paymentMethod: json['payment_method'] as String?,
      getOrderDetail: (json['get_order_detail'] as List<dynamic>?)
          ?.map((e) => GetOrderDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderDetailModelToJson(OrderDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_code': instance.orderCode,
      'order_status_id': instance.orderStatusId,
      'order_status_name': instance.orderStatusName,
      'seller_id': instance.sellerId,
      'seller_name': instance.sellerName,
      'customer_id': instance.customerId,
      'store_name': instance.storeName,
      'customer_name': instance.customerName,
      'phone_number': instance.phoneNumber,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'discount': instance.discount,
      'grand_total': instance.grandTotal,
      'description': instance.description,
      'order_date': instance.orderDate?.toIso8601String(),
      'payment_method_id': instance.paymentMethodId,
      'payment_method': instance.paymentMethod,
      'get_order_detail': instance.getOrderDetail,
    };

GetOrderDetail _$GetOrderDetailFromJson(Map<String, dynamic> json) =>
    GetOrderDetail(
      orderId: (json['order_id'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      productName: json['product_name'] as String?,
      unitTypeId: (json['unit_type_id'] as num?)?.toInt(),
      unitTypeName: json['unit_type_name'] as String?,
      qty: (json['qty'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      totalPrice: (json['total_price'] as num?)?.toInt(),
      productImage: json['product_image'] as String?,
    );

Map<String, dynamic> _$GetOrderDetailToJson(GetOrderDetail instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'id': instance.id,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'unit_type_id': instance.unitTypeId,
      'unit_type_name': instance.unitTypeName,
      'qty': instance.qty,
      'price': instance.price,
      'total_price': instance.totalPrice,
      'product_image': instance.productImage,
    };
