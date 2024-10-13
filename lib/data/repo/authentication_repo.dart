import 'dart:developer';

import 'package:flutter_ecogrow_customer/data/model/register_model.dart';
import 'package:flutter_ecogrow_customer/data/model/user_info_model.dart';
import 'package:flutter_ecogrow_customer/data/model/user_update_response_model.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:http_client/http_client.dart';

class AuthenticationRepo {
  AuthenticationRepo({
    required DioHttpClient dio,
  }) : _dio = dio;

  final DioHttpClient _dio;

  Future<UserInfoModel> login({required String token}) async {
    final response = await _dio.post(
      AppApi.login,
      // headers: {
      //   "Authorization": '$token',
      // },
    );

    return UserInfoModel.fromJson(response);
  }


  Future<UserUpdateResponseModel> editProfile({
    required String firstName,
    required String lastName,
    required String gender,
    required String dob,
    required int uid,
    required String phoneNumber,
    required String image,
  }) async {
    final body = {
      'id': uid,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'dob': dob,
      'phone_number': phoneNumber,
      'image': image,
    };
    final response = await _dio.post(AppApi.updateProfile, body: body);
    return UserUpdateResponseModel.fromJson(response);
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
        'Content-Type': 'application/json',
      });
      log('register response : $response');

      return RegisterUserModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }
}
