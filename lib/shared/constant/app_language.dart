import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage {
  AppLanguage({
    required SharedPreferences preferences,
  }) : _preferences = preferences;

  final SharedPreferences _preferences;

  Future<void> saveLanguage(String message) async {
    try {
      await _preferences.setString(AppConstant.languageKey, message);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getLanguage() async {
    try {
      final response = _preferences.getString(AppConstant.languageKey);
      if (response == null) {
        return AppConstant.defaultLanguage;
      }
      return response;
    } catch (e) {
      return e.toString();
    }
  }
}
