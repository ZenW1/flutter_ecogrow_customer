import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/cart/cart.dart';
import 'package:flutter_ecogrow_customer/category/category.dart';
import 'package:flutter_ecogrow_customer/checkout/checkout.dart';
import 'package:flutter_ecogrow_customer/checkout/view/payment_page.dart';
import 'package:flutter_ecogrow_customer/home/home.dart';
import 'package:flutter_ecogrow_customer/location/location.dart';
import 'package:flutter_ecogrow_customer/login/login.dart';
import 'package:flutter_ecogrow_customer/login/view/otp_page.dart';
import 'package:flutter_ecogrow_customer/main/view/main_page.dart';
import 'package:flutter_ecogrow_customer/order/order.dart';
import 'package:flutter_ecogrow_customer/product_detail/view/product_detail_page.dart';
import 'package:flutter_ecogrow_customer/profile/language/language.dart';
import 'package:flutter_ecogrow_customer/profile/profile.dart';
import 'package:flutter_ecogrow_customer/profile/view/privacy_policy_page.dart';
import 'package:flutter_ecogrow_customer/profile/view/profile_edit_page.dart';
import 'package:flutter_ecogrow_customer/profile/view/support_page.dart';
import 'package:flutter_ecogrow_customer/profile/view/term_condition_page.dart';
import 'package:flutter_ecogrow_customer/register/view/register_page.dart';
import 'package:flutter_ecogrow_customer/route/go_router_observable.dart';
import 'package:flutter_ecogrow_customer/splash/splash.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: SplashPage.routePath,
    initialExtra: {'environment': 'production'},
    observers: [
      MyNavigatorObserver(),
    ],
    routes: [
      GoRoute(
        path: SplashPage.routePath,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SplashPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: LoginPage.routePath,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: OTPPage.routePath,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const OTPPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: RegisterPage.routePath,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const RegisterPage(),
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
        path: ProfileEditPage.routePath,
        name: 'profile_edit',
        builder: (context, state) =>  ProfileEditPage(imageUrl: ''),
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
      // GoRoute(
      //   path: ProductDetailPage.routePath,
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     arguments: state.path,
      //     child:  ProductDetailPage(id: state.path.toString(),),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       return SlideTransition(
      //         position: Tween<Offset>(
      //           begin: const Offset(1, 0),
      //           end: Offset.zero,
      //         ).animate(animation),
      //         child: child,
      //       );
      //     },
      //   ),
      // ),
      // GoRoute(
      //   path: CheckoutPage.routePath,
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     child: const CheckoutPage(),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       return ScaleTransition(
      //         scale: animation,
      //         child: child,
      //       );
      //     },
      //   ),
      // ),
      GoRoute(
        path: PaymentPage.routePath,
        name: 'payment',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const PaymentPage(),
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
      GoRoute(
        path: SupportPage.routePath,
        name: 'support',
        builder: (context, state) => const SupportPage(),
      ),
      GoRoute(
        path: PrivacyPolicyPage.routePath,
        name: 'privacy',
        builder: (context, state) => const PrivacyPolicyPage(),
      ),
      GoRoute(
        path: TermConditionPage.routePath,
        name: 'term-condition',
        builder: (context, state) => const TermConditionPage(),
      ),
    ],
  );
}
