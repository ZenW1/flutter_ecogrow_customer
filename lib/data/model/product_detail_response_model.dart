// To parse this JSON data, do
//
//     final productDetailResponseModel = productDetailResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'product_detail_response_model.g.dart';

@JsonSerializable()
class ProductDetailResponseModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "product_name")
  final String? productName;
  @JsonKey(name: "base_qty")
  final int? baseQty;
  @JsonKey(name: "discount")
  final int? discount;
  @JsonKey(name: "category_id")
  final int? categoryId;
  @JsonKey(name: "category_name")
  final String? categoryName;
  @JsonKey(name: "seller_id")
  final int? sellerId;
  @JsonKey(name: "seller_name")
  final String? sellerName;
  @JsonKey(name: "store_name")
  final String? storeName;
  @JsonKey(name: "expired_on")
  final dynamic expiredOn;
  @JsonKey(name: "product_variation")
  final List<ProductVariation>? productVariation;
  @JsonKey(name: "product_image")
  final List<ProductImage>? productImage;
  final bool? isSelected ;

  ProductDetailResponseModel({
    this.id,
    this.productName,
    this.baseQty,
    this.discount,
    this.categoryId,
    this.categoryName,
    this.sellerId,
    this.sellerName,
    this.storeName,
    this.expiredOn,
    this.productVariation,
    this.productImage,
    this.isSelected,
  });

  factory ProductDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailResponseModelToJson(this);
}

@JsonSerializable()
class ProductImage {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "product_id")
  final int? productId;
  @JsonKey(name: "image")
  final String? image;

  ProductImage({
    this.id,
    this.productId,
    this.image,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) =>
      _$ProductImageFromJson(json);

  Map<String, dynamic> toJson() => _$ProductImageToJson(this);
}

@JsonSerializable()
class ProductVariation {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "product_id")
  final int? productId;
  @JsonKey(name: "base_qty")
  final int? baseQty;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "unit_type_id")
  final int? unitTypeId;
  @JsonKey(name: "unit_type_name")
  final String? unitTypeName;

  ProductVariation({
    this.id,
    this.productId,
    this.baseQty,
    this.price,
    this.unitTypeId,
    this.unitTypeName,
  });

  factory ProductVariation.fromJson(Map<String, dynamic> json) =>
      _$ProductVariationFromJson(json);

  Map<String, dynamic> toJson() => _$ProductVariationToJson(this);
}
