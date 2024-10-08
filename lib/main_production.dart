import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_ecogrow_customer/app/view/app.dart';
import 'package:flutter_ecogrow_customer/bootstrap.dart';
import 'package:flutter_ecogrow_customer/data/model/environment_model.dart';
import 'package:flutter_ecogrow_customer/data/repo/authentication_repo.dart';
import 'package:flutter_ecogrow_customer/data/repo/cart_repo.dart';
import 'package:flutter_ecogrow_customer/data/repo/product_repo.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_language.dart';
import 'package:http_client/http_client.dart';

import 'shared/constant/app_token.dart';

Future<void> main() async {
  await bootstrap(
    (sharedPreferences) async {
      final environment = EnvironmentModel.production(baseUrl: AppApi.baseUrl);
      final appToken = AppToken(preferences: sharedPreferences);
      final dioHttp = DioHttpClient(dio: Dio(), baseUrl: AppApi.baseUrl, appToken: appToken);
      final appLanguage = AppLanguage(preferences: sharedPreferences);
      final productRepo = ProductRepo(dio: dioHttp);
      final cartRepo = CartRepo(dio: dioHttp);
      final authRepo = AuthenticationRepo(dio: dioHttp);

      return App(
        environment: environment,
        dioHttpClient: dioHttp,
        authenticationRepo: authRepo,
        appLanguage: appLanguage,
        appToken: appToken,
        productRepo: productRepo,
        cartRepo: cartRepo,
      );
    },
  );
}
