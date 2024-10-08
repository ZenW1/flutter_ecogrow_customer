// To parse this JSON data, do
//
//     final productResponseModel = productResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'product_response_model.g.dart';

@JsonSerializable()
class ProductResponseModel {
  @JsonKey(name: "data")
  final List<ProductModel>? data;

  ProductResponseModel({
    this.data,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseModelToJson(this);
}

@JsonSerializable()
class ProductModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "product_name")
  final String? productName;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "qty")
  final int? qty;
  @JsonKey(name: "discount")
  final int? discount;
  @JsonKey(name: "category_id")
  final int? categoryId;
  @JsonKey(name: "category_name")
  final String? categoryName;
  @JsonKey(name: "unit_type_id")
  final int? unitTypeId;
  @JsonKey(name: "unit_type_name")
  final String? unitTypeName;
  @JsonKey(name: "status_id")
  final int? statusId;
  @JsonKey(name: "status_name")
  final String? statusName;
  @JsonKey(name: "seller_id")
  final int? sellerId;
  @JsonKey(name: "seller_name")
  final String? sellerName;
  @JsonKey(name: "store_name")
  final String? storeName;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "description")
  final dynamic description;
  @JsonKey(name: "expired_on")
  final dynamic expiredOn;

  ProductModel({
    this.id,
    this.productName,
    this.price,
    this.qty,
    this.discount,
    this.categoryId,
    this.categoryName,
    this.unitTypeId,
    this.unitTypeName,
    this.statusId,
    this.statusName,
    this.sellerId,
    this.sellerName,
    this.storeName,
    this.image,
    this.description,
    this.expiredOn,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
