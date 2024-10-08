

import 'package:flutter_ecogrow_customer/data/model/user_info_model.dart';

class RegisterUserModel {
  final int? status;
  final String? message;
  final UserModel? data;

  RegisterUserModel({
    this.status,
    this.message,
    this.data,
  });

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) =>
      RegisterUserModel(
        status: json["status"] as int,
        message: json["message"] as String,
        data: json["data"] == null
            ? null
            : UserModel.fromJson(json["data"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}
