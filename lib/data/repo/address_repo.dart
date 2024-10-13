import 'dart:developer';

import 'package:flutter_ecogrow_customer/data/model/address_model.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:http_client/http_client.dart';

class AddressRepo {
  AddressRepo({
    required DioHttpClient dio,
  }) : _dio = dio;

  final DioHttpClient _dio;

  Future<AddressResponseModel> getAddress() async {
    try {
      final res = await _dio.post(AppApi.getLocation);
      log('getAddress: $res');
      return AddressResponseModel.fromJson(res);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<AddressResponseModel> saveAddress({
    required String latitude,
    required String longitude,
    required String title,
    required String address,
    required String description,
  }) async {
    try {
      final body = {
        "customer_address": {
          "latitude": latitude,
          "longitude": longitude,
          "title": title,
          "address": address,
          "description": description,
        }
      };
      final res = await _dio.post(AppApi.addLocation, body: body);
      log('getAddress: $res');
      return AddressResponseModel.fromJson(res);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteAddress({required String id}) async {
    try {
      await _dio.post(
        AppApi.deleteLocation,
        headers: {
          'Authorization': '${await _dio.getAccessToken()}',
        },
        body: {'id': id},
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateAddress({
    required String id,
    required String latitude,
    required String longitude,
    required String title,
    required String address,
    required String description,
    required String isDefault,
  }) async {
    try {
      final body = {
        "customer_address": {
          "id": id,
          "latitude": latitude,
          "longitude": longitude,
          "title": title,
          "address": address,
          "description": description,
          "is_default" : isDefault,
        }
      };
      await _dio.post(
        AppApi.updateLocation,
        body: body,
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
