import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/authentication/authentication_bloc.dart';
import 'package:flutter_ecogrow_customer/cart/bloc/cart_bloc.dart';
import 'package:flutter_ecogrow_customer/category/category.dart';
import 'package:flutter_ecogrow_customer/data/model/environment_model.dart';
import 'package:flutter_ecogrow_customer/data/repo/address_repo.dart';
import 'package:flutter_ecogrow_customer/data/repo/authentication_repo.dart';
import 'package:flutter_ecogrow_customer/data/repo/cart_repo.dart';
import 'package:flutter_ecogrow_customer/data/repo/product_repo.dart';
import 'package:flutter_ecogrow_customer/environment/cubit/environment_cubit.dart';
import 'package:flutter_ecogrow_customer/l10n/l10n.dart';
import 'package:flutter_ecogrow_customer/location/cubit/address/address_cubit.dart';
import 'package:flutter_ecogrow_customer/location/cubit/current_address/current_address_bloc.dart';
import 'package:flutter_ecogrow_customer/location/cubit/location_cubit.dart';
import 'package:flutter_ecogrow_customer/login/login.dart';
import 'package:flutter_ecogrow_customer/main/main.dart';
import 'package:flutter_ecogrow_customer/product_detail/cubit/product_detail_cubit.dart';
import 'package:flutter_ecogrow_customer/profile/cubit/profile_edit/profile_edit_bloc.dart';
import 'package:flutter_ecogrow_customer/profile/language/cubit/language_cubit.dart';
import 'package:flutter_ecogrow_customer/register/cubit/register_cubit.dart';
import 'package:flutter_ecogrow_customer/route/app_router.dart';
import 'package:flutter_ecogrow_customer/shared/constant/global_overlay_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_language.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_token.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http_client/http_client.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({
    required EnvironmentModel environment,
    required DioHttpClient dioHttpClient,
    required AppLanguage appLanguage,
    required AppToken appToken,
    required ProductRepo productRepo,
    required CartRepo cartRepo,
    super.key,
  })  : _environment = environment,
        _appLanguage = appLanguage,
        _dioHttpClient = dioHttpClient,
        _appToken = appToken,
        _cartRepo = cartRepo,
        _productRepo = productRepo;
  final EnvironmentModel _environment;
  final DioHttpClient _dioHttpClient;
  final AppLanguage _appLanguage;
  final AppToken _appToken;
  final ProductRepo _productRepo;
  final CartRepo _cartRepo;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _environment),
        RepositoryProvider.value(value: _productRepo),
        RepositoryProvider.value(value: _appToken),
        RepositoryProvider.value(value: _cartRepo),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<EnvironmentCubit>(
            create: (context) => EnvironmentCubit()..load(_environment),
          ),
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(_appToken)..add(AppStartedEvent()),
          ),
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(
              AuthenticationRepo(dio: _dioHttpClient),
              _appToken,
            ),
          ),
          BlocProvider<CurrentAddressBloc>(
            create: (context) => CurrentAddressBloc()..add(CurrentAddressInit()),
          ),
          BlocProvider<ProfileEditBloc>(
            create: (context) => ProfileEditBloc(
              AuthenticationRepo(dio: _dioHttpClient),
            ),
          ),
          BlocProvider<RegisterCubit>(
            create: (_) => RegisterCubit(
              AuthenticationRepo(
                dio: _dioHttpClient,
              ),
              _appToken,
            ),
          ),
          BlocProvider<MainCubit>(
            create: (context) => MainCubit(),
          ),
          BlocProvider<LocationCubit>(
            create: (context) => LocationCubit()..getCurrentLocation(),
          ),
          BlocProvider(
            create: (context) => CategoryCubit(),
          ),
          BlocProvider<LanguageCubit>(
            create: (context) => LanguageCubit(
              _appLanguage,
            )..load(),
          ),
          BlocProvider(
            create: (context) => ProductDetailCubit(
              ProductRepo(dio: _dioHttpClient),
            ),
          ),
          BlocProvider(
            create: (context) => AddressCubit(
              AddressRepo(dio: _dioHttpClient),
            ),
          )
        ],
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status == LoginStatus.loading) {
              context.loaderOverlay.show();
            } else if (state.status == LoginStatus.loginOut) {
              _appToken.deleteToken();
              context.loaderOverlay.hide();
              AppRouter.router.push(LoginPage.routePath);
            }
          },
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
      ),
    );
  }
}
