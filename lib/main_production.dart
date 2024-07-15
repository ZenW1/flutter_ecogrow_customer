import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_ecogrow_customer/app/app.dart';
import 'package:flutter_ecogrow_customer/app/view/app.dart';
import 'package:flutter_ecogrow_customer/bootstrap.dart';
import 'package:flutter_ecogrow_customer/data/model/environment_model.dart';
import 'package:http_client/http_client.dart';

Future<void> main() async {
  await bootstrap((sharedPreferences)  async {
      final environment = EnvironmentModel.production();
      final dioHttp = DioHttpClient(dio: Dio(), baseUrl: '');

      return App(
        environment: environment,
        dioHttpClient: dioHttp,
      );
    },
  );
}
