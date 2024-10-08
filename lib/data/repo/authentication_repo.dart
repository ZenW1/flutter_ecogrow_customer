import 'dart:developer';

import 'package:flutter_ecogrow_customer/data/model/register_model.dart';
import 'package:flutter_ecogrow_customer/data/model/user_info_model.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:http_client/http_client.dart';

class AuthenticationRepo {
  AuthenticationRepo({
    required DioHttpClient dio,
  }) : _dio = dio;

  final DioHttpClient _dio;

  Future<UserInfoModel> login() async {
    try {
      final response = await _dio.post(AppApi.login,
        headers: {
          'Authorization': '${await _dio.getAccessToken()}',
        },
      );

      log('login response : $response');

      return UserInfoModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserInfoModel> editProfile({
    required UserInfoModel userData,
    required String old_image,
  }) async {
    try {
      final body = {
        'first_name': userData.customerProfile!.firstName,
        'last_name': userData.customerProfile!.lastName,
        'gender': userData.customerProfile!.gender,
        'dob': userData.customerProfile!.dob,
        'uid': userData.customerProfile!.id,
        'phone_number': userData.customerProfile!.phoneNumber,
        'new_image': userData.customerProfile!.image,
        'old_image' : old_image,
      };
      final response = await _dio.post(AppApi.updateProfile, body: body);
      return UserInfoModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<RegisterUserModel> registerUser({
    required String firstName,
    required String lastName,
    required String uid,
    required String gender,
    required String phoneNumber,
    required String dob,
    required String image,
  }) async {
    try {
      final body = {
        'first_name': firstName,
        'last_name': lastName,
        'gender': gender,
        'dob': dob,
        'uid': uid,
        'phone_number': phoneNumber,
        'image': image,
      };

      final response = await _dio.post(AppApi.register, body: body, headers: {
        'Authorization': '',
        'Content-Type': 'application/json',
      });
      log('register response : $response');

      return RegisterUserModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }
}
