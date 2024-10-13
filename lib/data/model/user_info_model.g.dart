// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      isRegister: json['isRegister'] as bool?,
      customerProfile: json['customer_profile'] == null
          ? null
          : UserModel.fromJson(
              json['customer_profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isRegister': instance.isRegister,
      'customer_profile': instance.customerProfile,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
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

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
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
