// To parse this JSON data, do
//
//     final categoryResponseModel = categoryResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'category_response_model.g.dart';


@JsonSerializable()
class CategoryResponseModel {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<CategoryModel>? data;

  CategoryResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) => _$CategoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseModelToJson(this);
}

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "category_name")
  final String? categoryName;
  @JsonKey(name: "image")
  final String? image;

  CategoryModel({
    this.id,
    this.categoryName,
    this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
