// To parse this JSON data, do
//
//     final cartListResponseModel = cartListResponseModelFromJson(jsonString);

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'cart_list_response_model.g.dart';


@HiveType(typeId: 1)
@JsonSerializable()
class CartListResponseModel {
  @HiveField(1)
  @JsonKey(name: "items")
  final List<CartModel>? items;

  CartListResponseModel({
    this.items,
  });

  factory CartListResponseModel.fromJson(Map<String, dynamic> json) => _$CartListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartListResponseModelToJson(this);
}

@HiveType(typeId: 2)
@JsonSerializable()
class CartModel {
  @HiveField(1)
  @JsonKey(name: "storeId")
  final String? storeId;
  @HiveField(3)
  @JsonKey(name: "storeName")
  final String? storeName;
  @HiveField(5)
  @JsonKey(name: "storeAddress")
  final String? storeAddress;
  @HiveField(7)
  @JsonKey(name: "storeImage")
  final String? storeImage;
  @HiveField(9)
  @JsonKey(name: "products")
  final List<CartProductModel>? products;
  bool? totalSelected ;
  int? totalPrice;

  CartModel({
    this.storeId,
    this.storeName,
    this.storeAddress,
    this.storeImage,
    this.products,
    this.totalSelected = false,
    this.totalPrice = 0,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}

@HiveType(typeId: 3)
@JsonSerializable()
class CartProductModel {
  @HiveField(1)
  @JsonKey(name: "id")
  final int? id;
  @HiveField(3)
  @JsonKey(name: "productId")
  final String? productId;
  @HiveField(5)
  @JsonKey(name: "productName")
  final String? productName;
  @HiveField(7)
  @JsonKey(name: "unit_type_id")
  final int? unitTypeId;
  @HiveField(9)
  @JsonKey(name: "unitType")
  final String? unitType;
  @HiveField(11)
  @JsonKey(name: "price")
  final double? price;
  @HiveField(13)
  @JsonKey(name: "stockQuantity")
  final int? stockQuantity;
  @HiveField(15)
  @JsonKey(name: "productImage")
  final String? productImage;
  @HiveField(17)
  @JsonKey(name: "description")
  final String? description;
  @HiveField(19)
  @JsonKey(name: "quantity")
   String? quantity;
  @HiveField(21)
  @JsonKey(name: "discount")
  final String? discount;
  @HiveField(23)
  @JsonKey(name: "expired_on")
  final DateTime? expiredOn;
  @HiveField(25)
  @JsonKey(name: "category_id")
  final int? categoryId;
  @HiveField(27)
  @JsonKey(name: "categories")
  final List<String>? categories;
  bool? selected;

  CartProductModel({
    this.id,
    this.productId,
    this.productName,
    this.unitTypeId,
    this.unitType,
    this.price,
    this.stockQuantity,
    this.productImage,
    this.description,
    this.quantity,
    this.discount,
    this.expiredOn,
    this.categoryId,
    this.categories,
    this.selected  =false,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) => _$CartProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductModelToJson(this);
}
