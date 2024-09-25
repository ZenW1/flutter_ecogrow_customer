// To parse this JSON data, do
//
//     final userInfoModel = userInfoModelFromJson(jsonString);

import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) =>
    UserInfoModel.fromJson(json.decode(str));

String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
  final int? status;
  final String? message;
  final bool? isRegister;
  final UserModel? data;

  UserInfoModel({
    this.status,
    this.message,
    this.isRegister,
    this.data,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        status: json["status"],
        message: json["message"],
        isRegister: json["isRegister"],
        data: json["data"] == null ? null : UserModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "isRegister": isRegister,
        "data": data?.toJson(),
      };
}

class RegisterUserModel {
  final int? status;
  final String? message;
  final UserModel? data;

  RegisterUserModel({
    this.status,
    this.message,
    this.data,
  });

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) => RegisterUserModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : UserModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class UserModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;
  final DateTime? dob;
  final String? createdAt;
  final String? updatedAt;
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

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        image: json["image"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "image": image,
        "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "created_at": createdAt,
        "updated_at": updatedAt,
        "phone_number": phoneNumber,
      };
}
