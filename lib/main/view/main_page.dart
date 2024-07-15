import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/cart/cart.dart';
import 'package:flutter_ecogrow_customer/category/category.dart';
import 'package:flutter_ecogrow_customer/home/home.dart';

import 'package:flutter_ecogrow_customer/main/main.dart';
import 'package:flutter_ecogrow_customer/order/order.dart';
import 'package:flutter_ecogrow_customer/profile/profile.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const String routePath = '/main';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainCubit(),
      child: const MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: context.read<MainCubit>().state.tabIndex,
            children: const [
              HomePage(),
              CategoryPage(),
              CartPage(),
              OrderPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              bottomNavigationBarItem(icon: 'home', label: 'Home'),
              bottomNavigationBarItem(icon: 'category', label: 'Category'),
              bottomNavigationBarItem(icon: 'cart', label: 'Cart'),
              bottomNavigationBarItem(icon: 'order', label: 'Order'),
              bottomNavigationBarItem(icon: 'profile', label: 'Profile'),
            ],
            currentIndex: context.read<MainCubit>().state.tabIndex,
            type: BottomNavigationBarType.shifting,
            useLegacyColorScheme: false,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.greyColor,
            mouseCursor: MaterialStateMouseCursor.clickable,
            onTap: (index) => context.read<MainCubit>().setTabIndex(index),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem({
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svg/$icon.svg'),
      label: label,
      activeIcon: SvgPicture.asset('assets/svg/${icon}_filled.svg'),
    );
  }
}
