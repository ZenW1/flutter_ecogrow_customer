import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/authentication/authentication_bloc.dart';
import 'package:flutter_ecogrow_customer/login/login.dart';
import 'package:flutter_ecogrow_customer/main/main.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const String routePath = '/';

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AppStarted) {
          context.loaderOverlay.show();
        } else if (state is Authenticated) {
          context.loaderOverlay.hide();
          GoRouter.of(context).go(MainPage.routePath);
        } else if (state is UnAuthenticated) {
          context.loaderOverlay.hide();
          GoRouter.of(context).go(LoginPage.routePath);
        }
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
