// import 'dart:async';
//
// import 'package:dio/dio.dart';
// import 'package:flutter_ecogrow_customer/app/view/app.dart';
// import 'package:flutter_ecogrow_customer/bootstrap.dart';
// import 'package:flutter_ecogrow_customer/data/model/environment_model.dart';
// import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
// import 'package:flutter_ecogrow_customer/shared/constant/app_language.dart';
// import 'package:flutter_ecogrow_customer/shared/constant/app_token.dart';
// import 'package:http_client/http_client.dart';
//
// Future<void> main() async {
//   await bootstrap(
//     (sharedPreferences) async {
//       final environment = EnvironmentModel.production();
//       final appToken = AppToken(preferences: sharedPreferences);
//       final appLanguage = AppLanguage(preferences: sharedPreferences);
//       final dioHttp = DioHttpClient(
//           dio: Dio(), baseUrl: AppApi.baseUrl, appToken: appToken);
//
//       return App(
//         environment: environment,
//         dioHttpClient: dioHttp,
//         appLanguage: appLanguage,
//         appToken: appToken,
//       );
//     },
//   );
// }
