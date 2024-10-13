// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUpdateResponseModel _$UserUpdateResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserUpdateResponseModel(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserUpdateModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserUpdateResponseModelToJson(
        UserUpdateResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

UserUpdateModel _$UserUpdateModelFromJson(Map<String, dynamic> json) =>
    UserUpdateModel(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      gender: json['gender'] as String?,
      image: json['image'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      phoneNumber: json['phone_number'] as String?,
    );

Map<String, dynamic> _$UserUpdateModelToJson(UserUpdateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'gender': instance.gender,
      'image': instance.image,
      'dob': instance.dob?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'phone_number': instance.phoneNumber,
    };
