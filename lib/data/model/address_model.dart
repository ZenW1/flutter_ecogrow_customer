// To parse this JSON data, do
//
//     final addressResponseModel = addressResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressResponseModel {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "address")
  final List<Address>? address;

  AddressResponseModel({
    this.status,
    this.message,
    this.address,
  });

  factory AddressResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressResponseModelToJson(this);
}

@JsonSerializable()
class Address {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "customer_id")
  final int? customerId;
  @JsonKey(name: "latitude")
  final String? latitude;
  @JsonKey(name: "longitude")
  final String? longitude;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "is_default")
  final int? isDefault;
  @JsonKey(name: "description")
  final String? description;

  Address({
    this.id,
    this.customerId,
    this.latitude,
    this.longitude,
    this.address,
    this.title,
    this.isDefault,
    this.description,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
