// To parse this JSON data, do
//
//     final userInfoModel = userInfoModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_info_model.g.dart';


@JsonSerializable()
class UserInfoModel {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "isRegister")
  final bool? isRegister;
  @JsonKey(name: "customer_profile")
  final UserModel? customerProfile;

  UserInfoModel({
    this.status,
    this.message,
    this.isRegister,
    this.customerProfile,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => _$UserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}

@JsonSerializable()
class UserModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "first_name")
  final String? firstName;
  @JsonKey(name: "last_name")
  final String? lastName;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "dob")
  final DateTime? dob;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "phone_number")
  final String? phoneNumber;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.dob,
    this.createdAt,
    this.updatedAt,
    this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
