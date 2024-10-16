import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecogrow_customer/data/model/cart_list_response_model.dart';
import 'package:flutter_ecogrow_customer/data/service/cart_service.dart';
import 'package:flutter_ecogrow_customer/data/service/local_storage_service.dart';
import 'package:flutter_ecogrow_customer/firebase_options.dart';
import 'package:flutter_ecogrow_customer/shared/constant/logger.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // log('onChange(${bloc.runtimeType}, $change)');
    AppPrettyLogger().logger.d('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    // log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    AppPrettyLogger()
        .logger
        .e('onError(${bloc.runtimeType}, $error,$stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

typedef AppBuilder = Future<Widget> Function(
  SharedPreferences sharedPreferences,
);

Future<void> bootstrap(AppBuilder builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // LocalStorageService.initialize();
  CartRepository.openCartBox();
  Hive.registerAdapter<CartListResponseModel>(CartListResponseModelAdapter());
  Hive.registerAdapter<CartModel>(CartModelAdapter());
  Hive.registerAdapter<CartProductModel>(CartProductModelAdapter());

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final sharedPreferences = await SharedPreferences.getInstance();

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here

  runApp(await builder(sharedPreferences));
}
