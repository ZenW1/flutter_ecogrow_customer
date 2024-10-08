// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressResponseModel _$AddressResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddressResponseModel(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      address: (json['address'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressResponseModelToJson(
        AddressResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'address': instance.address,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: (json['id'] as num?)?.toInt(),
      customerId: (json['customer_id'] as num?)?.toInt(),
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      address: json['address'] as String?,
      title: json['title'] as String?,
      isDefault: (json['is_default'] as num?)?.toInt(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'title': instance.title,
      'is_default': instance.isDefault,
      'description': instance.description,
    };
