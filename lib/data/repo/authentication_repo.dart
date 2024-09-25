import 'dart:developer';

import 'package:flutter_ecogrow_customer/data/model/user_info_model.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:http_client/http_client.dart';

class AuthenticationRepo {
  AuthenticationRepo({
    required DioHttpClient dio,
  }) : _dio = dio;

  final DioHttpClient _dio;

  Future<UserInfoModel> login({required String token}) async {
    try {
      final response = await _dio.post(AppApi.login,  headers: {
        'Authorization': '${token}',
      });
      return UserInfoModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserInfoModel> editProfile({
    required UserInfoModel userData,
  }) async {
    try {
      final body = {
        'first_name': userData.data!.firstName,
        'last_name': userData.data!.lastName,
        'gender': userData.data!.gender,
        'dob': userData.data!.dob,
        'uid': userData.data!.id,
        'phone_number': userData.data!.phoneNumber,
        'image': userData.data!.image,
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
