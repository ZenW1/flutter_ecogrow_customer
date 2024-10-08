import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecogrow_customer/data/model/register_model.dart';
import 'package:flutter_ecogrow_customer/data/model/user_info_model.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppToken {
  AppToken({
    required SharedPreferences preferences,
  }) : _preferences = preferences;

  final SharedPreferences _preferences;

  // stream
  // Stream<User?> get user => FirebaseAuth.instance.authStateChanges();

  Future<void> saveAccessToken(String message) async {
    try {
      await _preferences.setString(AppConstant.accessToken, message);
    } catch (e) {
      rethrow;
    }
  }

  // String accessToken() {
  //   return _preferences.getString(AppConstant.accessToken) ?? '';
  // }

  Future<String> getAccessToken() async {
    try {
      final response = _preferences.getString(AppConstant.accessToken);
      // if (response == null) {
      //   return '';
      // }
      return response!;
    } catch (e) {
      return e.toString();
    }
  }

  // Future<String> getRefreshToken() async {
  //   try {
  //     final response = _preferences.getString(AppConstant.refreshToken);
  //     if (response == null) {
  //       return '';
  //     }
  //     return response;
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }

  Future<void> saveRefreshToken(String message) async {
    try {
      await _preferences.setString(AppConstant.refreshToken, message);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> hasToken() async {
    try {
      final accessToken = await _preferences.getString(AppConstant.accessToken);
      final refreshToken =
          await _preferences.getString(AppConstant.refreshToken);
      return accessToken != null;
    } catch (e) {
      return false;
    }
  }

  Future<void> deleteToken() async {
    try {
      Future.wait(
        [
          _preferences.remove(AppConstant.accessToken),
          _preferences.remove(AppConstant.refreshToken),
          _preferences.remove(AppConstant.user),
        ],
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setUser(UserModel user) async {
    try {
      await _preferences.setString(AppConstant.user, jsonEncode(user.toJson()));
    } catch (e) {
      e.toString();
    }
  }

  // get user data as object
  Future<UserModel> getUser() {
    final response = _preferences.getString(AppConstant.user);
    if (response == null) {
      return Future.error('User not found');
    }
    return Future.value(UserModel.fromJson(json.decode(response) as Map<String, dynamic>));
  }

  // Future<void> deleteUser() async {
  //   try {
  //     await _preferences.remove(AppConstant.user);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<void> setUid(String uid) async {
    try {
      await _preferences.setString('___uid___', uid);
    } catch (e) {
      rethrow;
    }
  }

  String getUid() {
    return _preferences.getString('___uid___') ?? '';
  }
}
