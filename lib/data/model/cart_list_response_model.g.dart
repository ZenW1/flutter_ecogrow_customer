// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_list_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartListResponseModelAdapter extends TypeAdapter<CartListResponseModel> {
  @override
  final int typeId = 1;

  @override
  CartListResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartListResponseModel(
      cartId: fields[1] as String?,
      customerId: fields[3] as String?,
      items: (fields[5] as List?)?.cast<CartModel>(),
      totalPrice: fields[7] as double?,
      status: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CartListResponseModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.cartId)
      ..writeByte(3)
      ..write(obj.customerId)
      ..writeByte(5)
      ..write(obj.items)
      ..writeByte(7)
      ..write(obj.totalPrice)
      ..writeByte(9)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartListResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CartModelAdapter extends TypeAdapter<CartModel> {
  @override
  final int typeId = 2;

  @override
  CartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartModel(
      storeId: fields[1] as String?,
      storeName: fields[3] as String?,
      storeAddress: fields[5] as String?,
      storeImage: fields[7] as String?,
      products: (fields[9] as List?)?.cast<CartProductModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, CartModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.storeId)
      ..writeByte(3)
      ..write(obj.storeName)
      ..writeByte(5)
      ..write(obj.storeAddress)
      ..writeByte(7)
      ..write(obj.storeImage)
      ..writeByte(9)
      ..write(obj.products);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CartProductModelAdapter extends TypeAdapter<CartProductModel> {
  @override
  final int typeId = 3;

  @override
  CartProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartProductModel(
      productId: fields[1] as String?,
      productName: fields[3] as String?,
      unitType: fields[5] as String?,
      price: fields[7] as double?,
      stockQuantity: fields[9] as int?,
      productImage: fields[11] as String?,
      description: fields[13] as String?,
      quantity: fields[15] as String?,
      discount: fields[17] as String?,
      categories: (fields[19] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, CartProductModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(1)
      ..write(obj.productId)
      ..writeByte(3)
      ..write(obj.productName)
      ..writeByte(5)
      ..write(obj.unitType)
      ..writeByte(7)
      ..write(obj.price)
      ..writeByte(9)
      ..write(obj.stockQuantity)
      ..writeByte(11)
      ..write(obj.productImage)
      ..writeByte(13)
      ..write(obj.description)
      ..writeByte(15)
      ..write(obj.quantity)
      ..writeByte(17)
      ..write(obj.discount)
      ..writeByte(19)
      ..write(obj.categories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartListResponseModel _$CartListResponseModelFromJson(
        Map<String, dynamic> json) =>
    CartListResponseModel(
      cartId: json['cartId'] as String?,
      customerId: json['customerId'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => CartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CartListResponseModelToJson(
        CartListResponseModel instance) =>
    <String, dynamic>{
      'cartId': instance.cartId,
      'customerId': instance.customerId,
      'items': instance.items,
      'totalPrice': instance.totalPrice,
      'status': instance.status,
    };

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      storeId: json['storeId'] as String?,
      storeName: json['storeName'] as String?,
      storeAddress: json['storeAddress'] as String?,
      storeImage: json['storeImage'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => CartProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'storeId': instance.storeId,
      'storeName': instance.storeName,
      'storeAddress': instance.storeAddress,
      'storeImage': instance.storeImage,
      'products': instance.products,
    };

CartProductModel _$CartProductModelFromJson(Map<String, dynamic> json) =>
    CartProductModel(
      productId: json['productId'] as String?,
      productName: json['productName'] as String?,
      unitType: json['unitType'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      stockQuantity: (json['stockQuantity'] as num?)?.toInt(),
      productImage: json['productImage'] as String?,
      description: json['description'] as String?,
      quantity: json['quantity'] as String?,
      discount: json['discount'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CartProductModelToJson(CartProductModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'unitType': instance.unitType,
      'price': instance.price,
      'stockQuantity': instance.stockQuantity,
      'productImage': instance.productImage,
      'description': instance.description,
      'quantity': instance.quantity,
      'discount': instance.discount,
      'categories': instance.categories,
    };
