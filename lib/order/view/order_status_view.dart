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
    context.read<OrderCubit>().getOrderData();
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderLoaded) {
          return AnimatedList(
            itemBuilder: (context, index, animation) {
              return OrderItemWidget(
                data: state.data[index],
                status: status,
                animation: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: const Offset(0, 0),
                ).animate(animation),
                key: Key('$index'),
              );
            },
            initialItemCount: state.data.length,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
