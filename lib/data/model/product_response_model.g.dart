// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponseModel _$ProductResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductResponseModelToJson(
        ProductResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: (json['id'] as num?)?.toInt(),
      productName: json['product_name'] as String?,
      price: (json['price'] as num?)?.toInt(),
      qty: (json['qty'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      categoryId: (json['category_id'] as num?)?.toInt(),
      categoryName: json['category_name'] as String?,
      unitTypeId: (json['unit_type_id'] as num?)?.toInt(),
      unitTypeName: json['unit_type_name'] as String?,
      statusId: (json['status_id'] as num?)?.toInt(),
      statusName: json['status_name'] as String?,
      sellerId: (json['seller_id'] as num?)?.toInt(),
      sellerName: json['seller_name'] as String?,
      storeName: json['store_name'] as String?,
      image: json['image'] as String?,
      description: json['description'],
      expiredOn: json['expired_on'],
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'price': instance.price,
      'qty': instance.qty,
      'discount': instance.discount,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'unit_type_id': instance.unitTypeId,
      'unit_type_name': instance.unitTypeName,
      'status_id': instance.statusId,
      'status_name': instance.statusName,
      'seller_id': instance.sellerId,
      'seller_name': instance.sellerName,
      'store_name': instance.storeName,
      'image': instance.image,
      'description': instance.description,
      'expired_on': instance.expiredOn,
    };
