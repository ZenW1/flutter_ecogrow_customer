import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/authentication/authentication_bloc.dart';
import 'package:flutter_ecogrow_customer/cart/bloc/cart_bloc.dart';
import 'package:flutter_ecogrow_customer/cart/cart.dart';
import 'package:flutter_ecogrow_customer/category/category.dart';
import 'package:flutter_ecogrow_customer/checkout/checkout.dart';
import 'package:flutter_ecogrow_customer/data/model/environment_model.dart';
import 'package:flutter_ecogrow_customer/data/repo/address_repo.dart';
import 'package:flutter_ecogrow_customer/data/repo/authentication_repo.dart';
import 'package:flutter_ecogrow_customer/data/repo/cart_repo.dart';
import 'package:flutter_ecogrow_customer/data/repo/order_repo.dart';
import 'package:flutter_ecogrow_customer/data/repo/product_repo.dart';
import 'package:flutter_ecogrow_customer/data/service/cart_service.dart';
import 'package:flutter_ecogrow_customer/environment/cubit/environment_cubit.dart';
import 'package:flutter_ecogrow_customer/l10n/l10n.dart';
import 'package:flutter_ecogrow_customer/location/cubit/address/address_cubit.dart';
import 'package:flutter_ecogrow_customer/location/cubit/current_address/current_address_bloc.dart';
import 'package:flutter_ecogrow_customer/location/cubit/location_cubit.dart';
import 'package:flutter_ecogrow_customer/login/login.dart';
import 'package:flutter_ecogrow_customer/main/main.dart';
import 'package:flutter_ecogrow_customer/order/cubit/order_cubit.dart';
import 'package:flutter_ecogrow_customer/order_detail/bloc/order_detail_bloc.dart';
import 'package:flutter_ecogrow_customer/product/bloc/product_bloc.dart';
import 'package:flutter_ecogrow_customer/product_detail/cubit/product_detail_cubit.dart';
import 'package:flutter_ecogrow_customer/product_detail/cubit/product_selection/product_selection_cubit.dart';
import 'package:flutter_ecogrow_customer/profile/cubit/profile_cubit.dart';
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
    required OrderRepo orderRepo,
    // required CartRepository cartRepository,
    // required AuthenticationRepo authenticationRepo,
    super.key,
  })  : _environment = environment,
        _appLanguage = appLanguage,
        _dioHttpClient = dioHttpClient,
        _appToken = appToken,
        _cartRepo = cartRepo,
        _orderRepo = orderRepo,
        // _cartRepository = cartRepository,
        // _authenticationRepo = authenticationRepo,
        _productRepo = productRepo;
  final EnvironmentModel _environment;
  final DioHttpClient _dioHttpClient;
  final AppLanguage _appLanguage;
  final AppToken _appToken;
  final ProductRepo _productRepo;
  final CartRepo _cartRepo;
  final OrderRepo _orderRepo;

  // final CartRepository _cartRepository;
  // final AuthenticationRepo _authenticationRepo;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _environment),
        RepositoryProvider.value(value: _productRepo),
        RepositoryProvider.value(value: _appToken),
        RepositoryProvider.value(value: _cartRepo),
        RepositoryProvider.value(value: _orderRepo),
        // RepositoryProvider.value(value: _cartRepository),
        // RepositoryProvider.value(value: _authenticationRepo),
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
              _appToken,
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
            create: (context) => MainCubit(
              context.read<CartBloc>(),
            ),
          ),
          BlocProvider<LocationCubit>(
            create: (context) => LocationCubit()..getCurrentLocation(),
          ),
          BlocProvider(
            create: (context) => CategoryCubit(
              _productRepo,
            )..getCategory(),
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
            create: (context) => ProductBloc(
              context.read<ProductRepo>(),
            ),
          ),
          BlocProvider(
            create: (context) => AddressCubit(
              AddressRepo(dio: _dioHttpClient),
            ),
          ),
          BlocProvider(
            create: (context) => ProductSelectionCubit(),
          ),
          BlocProvider(
            create: (context) => CartBloc(
              _cartRepo,
            )..add(CartFetchEvent()),
          ),
          BlocProvider<ProfileCubit>(
            create: (context) => ProfileCubit(
              _appToken,
            ),
          ),
          BlocProvider<CheckoutCubit>(
            create: (context) => CheckoutCubit(
              _orderRepo,
            ),
          ),
          BlocProvider<OrderCubit>(
            create: (context) => OrderCubit(
              _orderRepo,
            ),
          ),
        ],
        child: BlocListener<CartBloc, CartState>(
          listener: (context, state) {
            if (state is CartAutoDelete) {
              context.read<CartBloc>().add(CartDeleteAutoEvent());
            }
          },
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state.status == LoginStatus.loading) {
                context.loaderOverlay.show();
              } else if (state.status == LoginStatus.loginOut) {
                _appToken.deleteToken();
                context.read<CartBloc>().add(CartClearEvent());
                context.loaderOverlay.hide();
                AppRouter.router.pushReplacement(MainPage.routePath);
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
      ),
    );
  }
}
