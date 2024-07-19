import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ecogrow_customer/order/order.dart';
import 'package:flutter_ecogrow_customer/order/view/order_status_view.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});
  static const String routePath = '/order';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderCubit(),
      child: const OrderView(),
    );
  }
}

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('My Order'),
              bottom: const TabBar(
                tabAlignment: TabAlignment.fill,
                indicatorColor: AppColors.primary,
                indicatorWeight: 1,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelColor: AppColors.greyColor,
                tabs: [
                  Tab(
                    text: 'Processing',
                  ),
                  Tab(
                    text: 'Pending',
                  ),
                  Tab(
                    text: 'Completed',
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                OrderStatusView(status: OrderStatus.all),
                OrderStatusView(status: OrderStatus.pending),
                OrderStatusView(status: OrderStatus.completed),
              ],
            ),
          ),
        );
      },
    );
  }
}
