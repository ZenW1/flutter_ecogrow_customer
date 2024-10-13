// To parse this JSON data, do
//
//     final productRecentResponseModel = productRecentResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'product_recent_response_model.g.dart';



@JsonSerializable()
class ProductRecentResponseModel {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<ProductRecentModel>? data;

  ProductRecentResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProductRecentResponseModel.fromJson(Map<String, dynamic> json) => _$ProductRecentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductRecentResponseModelToJson(this);
}

@JsonSerializable()
class ProductRecentModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "product_id")
  final int? productId;
  @JsonKey(name: "product_name")
  final String? productName;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "category_id")
  final int? categoryId;
  @JsonKey(name: "category_name")
  final String? categoryName;
  @JsonKey(name: "unit_type_id")
  final int? unitTypeId;
  @JsonKey(name: "unit_type_name")
  final String? unitTypeName;
  @JsonKey(name: "image")
  final String? image;

  ProductRecentModel({
    this.id,
    this.productId,
    this.productName,
    this.price,
    this.categoryId,
    this.categoryName,
    this.unitTypeId,
    this.unitTypeName,
    this.image,
  });

  factory ProductRecentModel.fromJson(Map<String, dynamic> json) => _$ProductRecentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductRecentModelToJson(this);
}
