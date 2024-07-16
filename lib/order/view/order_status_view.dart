import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/order/cubit/order_cubit.dart';
import 'package:flutter_ecogrow_customer/order/view/widget/order_item_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';

class OrderStatusView extends StatelessWidget {
  const OrderStatusView({required this.status, super.key});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final data = context.read<OrderCubit>().data;
        return OrderItemWidget(
          data: data[index],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox();
      },
      itemCount: 5,
    );
  }
}
