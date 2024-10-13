// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_recent_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRecentResponseModel _$ProductRecentResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductRecentResponseModel(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductRecentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductRecentResponseModelToJson(
        ProductRecentResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ProductRecentModel _$ProductRecentModelFromJson(Map<String, dynamic> json) =>
    ProductRecentModel(
      id: (json['id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      productName: json['product_name'] as String?,
      price: (json['price'] as num?)?.toInt(),
      categoryId: (json['category_id'] as num?)?.toInt(),
      categoryName: json['category_name'] as String?,
      unitTypeId: (json['unit_type_id'] as num?)?.toInt(),
      unitTypeName: json['unit_type_name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ProductRecentModelToJson(ProductRecentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'price': instance.price,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'unit_type_id': instance.unitTypeId,
      'unit_type_name': instance.unitTypeName,
      'image': instance.image,
    };
