import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/category/category.dart';
import 'package:flutter_ecogrow_customer/l10n/l10n.dart';
import 'package:flutter_ecogrow_customer/main/cubit/main_cubit.dart';
import 'package:flutter_ecogrow_customer/route/app_router.dart';
import 'package:flutter_ecogrow_customer/shared/constant/GlobalOverLayWidget.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_theme.dart';

import 'package:http_client/http_client.dart';
import 'package:sizer/sizer.dart';

import '../../data/model/environment_model.dart';
import '../../environment/cubit/environment_cubit.dart';

class App extends StatelessWidget {
  const App({
    required EnvironmentModel environment,
    required DioHttpClient dioHttpClient,
    super.key,
  })  : _environment = environment,
        _dioHttpClient = dioHttpClient;

  final EnvironmentModel _environment;
  final DioHttpClient _dioHttpClient;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _environment),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => EnvironmentCubit()..load(_environment),
          ),
          BlocProvider<MainCubit>(
            create: (context) => MainCubit(),
          ),
          BlocProvider(
            create: (context) => CategoryCubit(),
          ),
        ],
        child: Sizer(
          builder: (
            BuildContext context,
            Orientation orientation,
            DeviceType deviceType,
          ) {
            return MaterialApp.router(
              theme: AppTheme.getAppTheme(),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: AppRouter.router,
              builder: (context, child) {
                return BlocBuilder<EnvironmentCubit, EnvironmentState>(
                  builder: (context, state) {
                    return GlobalOverLayWidget(
                      child: child!,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
