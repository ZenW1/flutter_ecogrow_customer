// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailResponseModel _$ProductDetailResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductDetailResponseModel(
      id: (json['id'] as num?)?.toInt(),
      productName: json['product_name'] as String?,
      baseQty: (json['base_qty'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      categoryId: (json['category_id'] as num?)?.toInt(),
      categoryName: json['category_name'] as String?,
      sellerId: (json['seller_id'] as num?)?.toInt(),
      sellerName: json['seller_name'] as String?,
      storeName: json['store_name'] as String?,
      expiredOn: json['expired_on'],
      productVariation: (json['product_variation'] as List<dynamic>?)
          ?.map((e) => ProductVariation.fromJson(e as Map<String, dynamic>))
          .toList(),
      productImage: (json['product_image'] as List<dynamic>?)
          ?.map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSelected: json['isSelected'] as bool?,
    );

Map<String, dynamic> _$ProductDetailResponseModelToJson(
        ProductDetailResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'base_qty': instance.baseQty,
      'discount': instance.discount,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'seller_id': instance.sellerId,
      'seller_name': instance.sellerName,
      'store_name': instance.storeName,
      'expired_on': instance.expiredOn,
      'product_variation': instance.productVariation,
      'product_image': instance.productImage,
      'isSelected': instance.isSelected,
    };

ProductImage _$ProductImageFromJson(Map<String, dynamic> json) => ProductImage(
      id: (json['id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ProductImageToJson(ProductImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'image': instance.image,
    };

ProductVariation _$ProductVariationFromJson(Map<String, dynamic> json) =>
    ProductVariation(
      id: (json['id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      baseQty: (json['base_qty'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      unitTypeId: (json['unit_type_id'] as num?)?.toInt(),
      unitTypeName: json['unit_type_name'] as String?,
    );

Map<String, dynamic> _$ProductVariationToJson(ProductVariation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'base_qty': instance.baseQty,
      'price': instance.price,
      'unit_type_id': instance.unitTypeId,
      'unit_type_name': instance.unitTypeName,
    };
