import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/cart/cart.dart';
import 'package:flutter_ecogrow_customer/category/category.dart';
import 'package:flutter_ecogrow_customer/home/home.dart';
import 'package:flutter_ecogrow_customer/location/location.dart';
import 'package:flutter_ecogrow_customer/login/login.dart';
import 'package:flutter_ecogrow_customer/login/view/otp_page.dart';
import 'package:flutter_ecogrow_customer/main/view/main_page.dart';
import 'package:flutter_ecogrow_customer/order/order.dart';
import 'package:flutter_ecogrow_customer/product/view/product_page.dart';
import 'package:flutter_ecogrow_customer/profile/language/language.dart';
import 'package:flutter_ecogrow_customer/profile/profile.dart';
import 'package:flutter_ecogrow_customer/route/go_router_observable.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: LoginPage.routePath,
    observers: [
      MyNavigatorObserver(),
    ],
    routes: [
      GoRoute(
        path: LoginPage.routePath,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: MainPage.routePath,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const MainPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: OTPPage.routePath,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const OTPPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: HomePage.routePath,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: CartPage.routePath,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const CartPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: CategoryPage.routePath,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const CategoryPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: OrderPage.routePath,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const OrderPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: ProfilePage.routePath,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const ProfilePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: LanguagePage.routePath,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const LanguagePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: ProductPage.routePath,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const ProductPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: LocationPage.routePath,
        name: 'location',
        builder: (context, state) => const LocationPage(),
      ),
    ],
  );
}
