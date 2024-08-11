import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/authentication/authentication_bloc.dart';
import 'package:flutter_ecogrow_customer/category/category.dart';
import 'package:flutter_ecogrow_customer/data/model/environment_model.dart';
import 'package:flutter_ecogrow_customer/environment/cubit/environment_cubit.dart';
import 'package:flutter_ecogrow_customer/l10n/l10n.dart';
import 'package:flutter_ecogrow_customer/location/cubit/location_cubit.dart';
import 'package:flutter_ecogrow_customer/login/cubit/login_cubit.dart';
import 'package:flutter_ecogrow_customer/login/view/login_page.dart';
import 'package:flutter_ecogrow_customer/main/cubit/main_cubit.dart';
import 'package:flutter_ecogrow_customer/main/main.dart';
import 'package:flutter_ecogrow_customer/profile/language/cubit/language_cubit.dart';
import 'package:flutter_ecogrow_customer/route/app_router.dart';
import 'package:flutter_ecogrow_customer/shared/constant/GlobalOverLayWidget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_language.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_token.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:http_client/http_client.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({
    required EnvironmentModel environment,
    required DioHttpClient dioHttpClient,
    required AppLanguage appLanguage,
    required AppToken appToken,
    super.key,
  })
      : _environment = environment,
        _appLanguage = appLanguage,
        _dioHttpClient = dioHttpClient,
        _appToken = appToken;
  final EnvironmentModel _environment;
  final DioHttpClient _dioHttpClient;
  final AppLanguage _appLanguage;
  final AppToken _appToken;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _environment),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<EnvironmentCubit>(
            create: (context) =>
            EnvironmentCubit()
              ..load(_environment),
          ),
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(_appToken),
          ),
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(),
          ),
          BlocProvider<MainCubit>(
            create: (context) => MainCubit(),
          ),
          BlocProvider<LocationCubit>(
            create: (context) => LocationCubit(),
          ),
          BlocProvider(
            create: (context) => CategoryCubit(),
          ),
          BlocProvider<LanguageCubit>(
            create: (context) =>
            LanguageCubit(
              _appLanguage,
            )
              ..load(),
          ),
        ],
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
             if(state is AppStarted){
               context.loaderOverlay.show();
             } else if(state is Authenticated){
               Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MainPage()),
               );
             } else if (state is UnAuthenticated){
               GoRouter.of(context).go('/login');
             }
          },
          child: Sizer(
            builder: (BuildContext context,
                Orientation orientation,
                DeviceType deviceType,) {
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
      ),
    );
  }
}
