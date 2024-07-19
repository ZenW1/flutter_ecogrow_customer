import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/category/category.dart';
import 'package:flutter_ecogrow_customer/data/model/environment_model.dart';
import 'package:flutter_ecogrow_customer/environment/cubit/environment_cubit.dart';
import 'package:flutter_ecogrow_customer/l10n/l10n.dart';
import 'package:flutter_ecogrow_customer/main/cubit/main_cubit.dart';
import 'package:flutter_ecogrow_customer/profile/language/cubit/language_cubit.dart';
import 'package:flutter_ecogrow_customer/route/app_router.dart';
import 'package:flutter_ecogrow_customer/shared/constant/GlobalOverLayWidget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_language.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http_client/http_client.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({
    required EnvironmentModel environment,
    required DioHttpClient dioHttpClient,
    required AppLanguage appLanguage,
    super.key,
  })  : _environment = environment,
        _appLanguage = appLanguage,
        _dioHttpClient = dioHttpClient;
  final EnvironmentModel _environment;
  final DioHttpClient _dioHttpClient;
  final AppLanguage _appLanguage;

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
          BlocProvider<LanguageCubit>(
            create: (context) => LanguageCubit(
              _appLanguage,
            )..load(),
          ),
        ],
        child: Sizer(
          builder: (
            BuildContext context,
            Orientation orientation,
            DeviceType deviceType,
          ) {
            return BlocSelector<LanguageCubit, LanguageState, LanguageSelected>(
              selector: (state) {
                if (state is LanguageSelected) {
                  return state;
                }
                return const LanguageSelected(Locale('km'));
              },
              builder: (context, state) {
                return MaterialApp.router(
                  theme: AppTheme.getAppTheme(),
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('en', ''),
                    Locale('km', ''),
                  ],
                  locale: state.locale,
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
            );
          },
        ),
      ),
    );
  }
}
