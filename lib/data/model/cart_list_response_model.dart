// To parse this JSON data, do
//
//     final cartListResponseModel = cartListResponseModelFromJson(jsonString);

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_list_response_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CartListResponseModel {
  @HiveField(1)
  @JsonKey(name: "cartId")
  final String? cartId;
  @HiveField(3)
  @JsonKey(name: "customerId")
  final String? customerId;
  @HiveField(5)
  @JsonKey(name: "items")
  final List<CartModel>? items;
  @HiveField(7)
  @JsonKey(name: "totalPrice")
  final double? totalPrice;
  @HiveField(9)
  @JsonKey(name: "status")
  final String? status;

  CartListResponseModel({
    this.cartId,
    this.customerId,
    this.items,
    this.totalPrice,
    this.status,
  });

  factory CartListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CartListResponseModelFromJson(json);

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

  CartModel({
    this.storeId,
    this.storeName,
    this.storeAddress,
    this.storeImage,
    this.products,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}

@HiveType(typeId: 3)
@JsonSerializable()
class CartProductModel {
  @HiveField(1)
  @JsonKey(name: "productId")
  final String? productId;
  @HiveField(3)
  @JsonKey(name: "productName")
  final String? productName;
  @HiveField(5)
  @JsonKey(name: "unitType")
  final String? unitType;
  @HiveField(7)
  @JsonKey(name: "price")
  final double? price;
  @HiveField(9)
  @JsonKey(name: "stockQuantity")
  final int? stockQuantity;
  @HiveField(11)
  @JsonKey(name: "productImage")
  final String? productImage;
  @HiveField(13)
  @JsonKey(name: "description")
  final String? description;
  @HiveField(15)
  @JsonKey(name: "quantity")
  final String? quantity;
  @HiveField(17)
  @JsonKey(name: "discount")
  final String? discount;
  @HiveField(19)
  @JsonKey(name: "categories")
  final List<String>? categories;

  CartProductModel({
    this.productId,
    this.productName,
    this.unitType,
    this.price,
    this.stockQuantity,
    this.productImage,
    this.description,
    this.quantity,
    this.discount,
    this.categories,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductModelToJson(this);
}
