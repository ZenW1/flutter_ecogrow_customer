// To parse this JSON data, do
//
//     final productDetailResponseModel = productDetailResponseModelFromJson(jsonString);

import 'dart:convert';

ProductDetailResponseModel productDetailResponseModelFromJson(String str) => ProductDetailResponseModel.fromJson(json.decode(str));

String productDetailResponseModelToJson(ProductDetailResponseModel data) => json.encode(data.toJson());

class ProductDetailResponseModel {
  int? status;
  String? message;
  Data? data;

  ProductDetailResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProductDetailResponseModel.fromJson(Map<String, dynamic> json) => ProductDetailResponseModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int? locationId;
  String? phoneNumber;
  int? sellerId;
  int? id;
  String? productName;
  int? price;
  int? qty;
  int? categoryId;
  int? unitTypeId;
  int? statusId;
  int? pricingType;
  int? createdBy;
  int? approvedBy;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? requestedAt;
  String? categoryName;
  String? storeName;
  String? sellerImage;
  String? statusName;
  String? sellerName;
  String? locationName;
  List<ProductImage>? productImage;
  List<ProductVariation>? productVariation;

  Data({
    this.locationId,
    this.phoneNumber,
    this.sellerId,
    this.id,
    this.productName,
    this.price,
    this.qty,
    this.categoryId,
    this.unitTypeId,
    this.statusId,
    this.pricingType,
    this.createdBy,
    this.approvedBy,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.requestedAt,
    this.categoryName,
    this.storeName,
    this.sellerImage,
    this.statusName,
    this.sellerName,
    this.locationName,
    this.productImage,
    this.productVariation,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    locationId: json["location_id"],
    phoneNumber: json["phone_number"],
    sellerId: json["seller_id"],
    id: json["id"],
    productName: json["product_name"],
    price: json["price"],
    qty: json["qty"],
    categoryId: json["category_id"],
    unitTypeId: json["unit_type_id"],
    statusId: json["status_id"],
    pricingType: json["pricing_type"],
    createdBy: json["created_by"],
    approvedBy: json["approved_by"],
    description: json["description"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    requestedAt: json["requested_at"],
    categoryName: json["category_name"],
    storeName: json["store_name"],
    sellerImage: json["seller_image"],
    statusName: json["status_name"],
    sellerName: json["seller_name"],
    locationName: json["location_name"],
    productImage: json["product_image"] == null ? [] : List<ProductImage>.from(json["product_image"]!.map((x) => ProductImage.fromJson(x))),
    productVariation: json["product_variation"] == null ? [] : List<ProductVariation>.from(json["product_variation"]!.map((x) => ProductVariation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "location_id": locationId,
    "phone_number": phoneNumber,
    "seller_id": sellerId,
    "id": id,
    "product_name": productName,
    "price": price,
    "qty": qty,
    "category_id": categoryId,
    "unit_type_id": unitTypeId,
    "status_id": statusId,
    "pricing_type": pricingType,
    "created_by": createdBy,
    "approved_by": approvedBy,
    "description": description,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "requested_at": requestedAt,
    "category_name": categoryName,
    "store_name": storeName,
    "seller_image": sellerImage,
    "status_name": statusName,
    "seller_name": sellerName,
    "location_name": locationName,
    "product_image": productImage == null ? [] : List<dynamic>.from(productImage!.map((x) => x.toJson())),
    "product_variation": productVariation == null ? [] : List<dynamic>.from(productVariation!.map((x) => x.toJson())),
  };
}

class ProductImage {
  int? id;
  int? productId;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? productImage;

  ProductImage({
    this.id,
    this.productId,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.productImage,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
    id: json["id"],
    productId: json["product_id"],
    image: json["image"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    productImage: json["product_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "image": image,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "product_image": productImage,
  };
}

class ProductVariation {
  int? id;
  int? productId;
  int? unitTypeId;
  int? price;
  int? qty;
  String? createdAt;
  String? updatedAt;
  String? unitTypeName;

  ProductVariation({
    this.id,
    this.productId,
    this.unitTypeId,
    this.price,
    this.qty,
    this.createdAt,
    this.updatedAt,
    this.unitTypeName,
  });

  factory ProductVariation.fromJson(Map<String, dynamic> json) => ProductVariation(
    id: json["id"],
    productId: json["product_id"],
    unitTypeId: json["unit_type_id"],
    price: json["price"],
    qty: json["qty"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    unitTypeName: json["unit_type_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "unit_type_id": unitTypeId,
    "price": price,
    "qty": qty,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "unit_type_name": unitTypeName,
  };
}
