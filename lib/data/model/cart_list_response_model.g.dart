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
      items: (fields[1] as List?)?.cast<CartModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, CartListResponseModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.items);
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
      id: fields[1] as int?,
      productId: fields[3] as String?,
      productName: fields[5] as String?,
      unitTypeId: fields[7] as int?,
      unitType: fields[9] as String?,
      price: fields[11] as double?,
      stockQuantity: fields[13] as int?,
      productImage: fields[15] as String?,
      description: fields[17] as String?,
      quantity: fields[19] as String?,
      discount: fields[21] as String?,
      expiredOn: fields[23] as DateTime?,
      categoryId: fields[25] as int?,
      categories: (fields[27] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, CartProductModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.productId)
      ..writeByte(5)
      ..write(obj.productName)
      ..writeByte(7)
      ..write(obj.unitTypeId)
      ..writeByte(9)
      ..write(obj.unitType)
      ..writeByte(11)
      ..write(obj.price)
      ..writeByte(13)
      ..write(obj.stockQuantity)
      ..writeByte(15)
      ..write(obj.productImage)
      ..writeByte(17)
      ..write(obj.description)
      ..writeByte(19)
      ..write(obj.quantity)
      ..writeByte(21)
      ..write(obj.discount)
      ..writeByte(23)
      ..write(obj.expiredOn)
      ..writeByte(25)
      ..write(obj.categoryId)
      ..writeByte(27)
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
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => CartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartListResponseModelToJson(
        CartListResponseModel instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      storeId: json['storeId'] as String?,
      storeName: json['storeName'] as String?,
      storeAddress: json['storeAddress'] as String?,
      storeImage: json['storeImage'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => CartProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalSelected: json['totalSelected'] as bool? ?? false,
      totalPrice: (json['totalPrice'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'storeId': instance.storeId,
      'storeName': instance.storeName,
      'storeAddress': instance.storeAddress,
      'storeImage': instance.storeImage,
      'products': instance.products,
      'totalSelected': instance.totalSelected,
      'totalPrice': instance.totalPrice,
    };

CartProductModel _$CartProductModelFromJson(Map<String, dynamic> json) =>
    CartProductModel(
      id: (json['id'] as num?)?.toInt(),
      productId: json['productId'] as String?,
      productName: json['productName'] as String?,
      unitTypeId: (json['unit_type_id'] as num?)?.toInt(),
      unitType: json['unitType'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      stockQuantity: (json['stockQuantity'] as num?)?.toInt(),
      productImage: json['productImage'] as String?,
      description: json['description'] as String?,
      quantity: json['quantity'] as String?,
      discount: json['discount'] as String?,
      expiredOn: json['expired_on'] == null
          ? null
          : DateTime.parse(json['expired_on'] as String),
      categoryId: (json['category_id'] as num?)?.toInt(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      selected: json['selected'] as bool? ?? false,
    );

Map<String, dynamic> _$CartProductModelToJson(CartProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'productName': instance.productName,
      'unit_type_id': instance.unitTypeId,
      'unitType': instance.unitType,
      'price': instance.price,
      'stockQuantity': instance.stockQuantity,
      'productImage': instance.productImage,
      'description': instance.description,
      'quantity': instance.quantity,
      'discount': instance.discount,
      'expired_on': instance.expiredOn?.toIso8601String(),
      'category_id': instance.categoryId,
      'categories': instance.categories,
      'selected': instance.selected,
    };
