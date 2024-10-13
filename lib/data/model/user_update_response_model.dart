// To parse this JSON data, do
//
//     final userUpdateResponseModel = userUpdateResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_update_response_model.g.dart';


@JsonSerializable()
class UserUpdateResponseModel {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final UserUpdateModel? data;

  UserUpdateResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory UserUpdateResponseModel.fromJson(Map<String, dynamic> json) => _$UserUpdateResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserUpdateResponseModelToJson(this);
}

@JsonSerializable()
class UserUpdateModel {
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

  UserUpdateModel({
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

  factory UserUpdateModel.fromJson(Map<String, dynamic> json) => _$UserUpdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserUpdateModelToJson(this);
}
