// To parse this JSON data, do
//
//     final cartListResponseModel = cartListResponseModelFromJson(jsonString);

import 'dart:convert';

CartListResponseModel cartListResponseModelFromJson(String str) => CartListResponseModel.fromJson(json.decode(str));

String cartListResponseModelToJson(CartListResponseModel data) => json.encode(data.toJson());

class CartListResponseModel {
  final String? cartId;
  final String? customerId;
  final List<CartListModel>? items;
  final double? totalPrice;
  final String? status;

  CartListResponseModel({
    this.cartId,
    this.customerId,
    this.items,
    this.totalPrice,
    this.status,
  });

  factory CartListResponseModel.fromJson(Map<String, dynamic> json) => CartListResponseModel(
    cartId: json["cartId"],
    customerId: json["customerId"],
    items: json["items"] == null ? [] : List<CartListModel>.from(json["items"]!.map((x) => CartListModel.fromJson(x))),
    totalPrice: json["totalPrice"]?.toDouble(),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "cartId": cartId,
    "customerId": customerId,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "totalPrice": totalPrice,
    "status": status,
  };
}

class CartListModel {
  final String? storeId;
  final String? storeName;
  final String? storeAddress;
  final String? storeImage;
  final List<CartItemModel>? products;

  CartListModel({
    this.storeId,
    this.storeName,
    this.storeAddress,
    this.storeImage,
    this.products,
  });

  factory CartListModel.fromJson(Map<String, dynamic> json) => CartListModel(
    storeId: json["storeId"],
    storeName: json["storeName"],
    storeAddress: json["storeAddress"],
    storeImage: json["storeImage"],
    products: json["products"] == null ? [] : List<CartItemModel>.from(json["products"]!.map((x) => CartItemModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "storeId": storeId,
    "storeName": storeName,
    "storeAddress": storeAddress,
    "storeImage": storeImage,
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class CartItemModel {
  final String? productId;
  final String? productName;
  final String? unitType;
  final double? price;
  final int? stockQuantity;
  final String? productImage;
  final String? description;
  final String? quantity;
  final String? discount;
  final List<String>? categories;

  CartItemModel({
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

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
    productId: json["productId"],
    productName: json["productName"],
    unitType: json["unitType"],
    price: json["price"]?.toDouble(),
    stockQuantity: json["stockQuantity"],
    productImage: json["productImage"],
    description: json["description"],
    quantity: json["quantity"],
    discount: json["discount"],
    categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "productName": productName,
    "unitType": unitType,
    "price": price,
    "stockQuantity": stockQuantity,
    "productImage": productImage,
    "description": description,
    "quantity": quantity,
    "discount": discount,
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
  };
}
