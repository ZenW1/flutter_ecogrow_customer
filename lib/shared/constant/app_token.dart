import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppToken {
  AppToken({
    required SharedPreferences preferences,
  }) : _preferences = preferences;

  final SharedPreferences _preferences;

  Future<void> saveAccessToken(String message) async {
    try {
      await _preferences.setString(AppConstant.accessToken, message);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getAccessToken() async {
    try {
      final response = _preferences.getString(AppConstant.accessToken);
      if (response == null) {
        return '';
      }
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> getRefreshToken() async {
    try {
      final response = _preferences.getString(AppConstant.refreshToken);
      if (response == null) {
        return '';
      }
      return response;
    } catch (e) {
      return e.toString();
    }
  }

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
      final refreshToken = await _preferences.getString(AppConstant.refreshToken);
      return accessToken != null;
    } catch (e) {
      return false;
    }
  }

  Future<void> deleteToken() async {
    try{
      await _preferences.remove(AppConstant.accessToken);
      await _preferences.remove(AppConstant.refreshToken);
    }catch (e) {
      return ;
    }
  }
}
