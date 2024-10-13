import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/authentication/authentication_bloc.dart';
import 'package:flutter_ecogrow_customer/data/repo/order_repo.dart';

import 'package:flutter_ecogrow_customer/order/order.dart';
import 'package:flutter_ecogrow_customer/order/view/order_status_view.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/unauthicate_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  static const String routePath = '/order';

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  @override
  void initState() {
    context.read<OrderCubit>().getOrderData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return context.read<AuthenticationBloc>().appToken.hasToken() ?  const OrderView() :  UnauthenticatePage();
  }
}

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text('My Order'),
              bottom: const TabBar(
                tabAlignment: TabAlignment.center,
                indicatorColor: AppColors.primary,
                indicatorWeight: 1,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                // indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelColor: AppColors.greyColor,
                tabs: [
                  // Tab(
                  //   text: 'All',
                  // ),
                  Tab(
                    text: 'Processing',
                  ),
                  Tab(
                    text: 'Pending',
                  ),
                  Tab(
                    text: 'Cancelled',
                  ),
                  Tab(
                    text: 'Completed',
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                // OrderStatusView(status: null),
                OrderStatusView(status: OrderStatus.pending),
                OrderStatusView(status: OrderStatus.processing),
                OrderStatusView(status: OrderStatus.cancelled),
                OrderStatusView(status: OrderStatus.completed),
              ],
            ),
          ),
        );
      },
    );
  }
}
