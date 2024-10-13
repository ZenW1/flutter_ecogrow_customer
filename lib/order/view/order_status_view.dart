import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/order/cubit/order_cubit.dart';
import 'package:flutter_ecogrow_customer/order/view/widget/order_item_widget.dart';
import 'package:flutter_ecogrow_customer/order_detail/view/order_detail_page.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_constant_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/validator_extension.dart';
import 'package:flutter_ecogrow_customer/shared/widget/emtpy_data_widget.dart';

class OrderStatusView extends StatelessWidget {
  const OrderStatusView({required this.status, super.key});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    context.read<OrderCubit>().getOrderData();
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is OrderLoaded) {
          return state.data.data!.isEmpty
              ? Center(
                  child: EmptyDataWidget(),
                )
              : AnimatedList(
                  itemBuilder: (context, index, animation) {
                    if (ValidatorExtension.orderStatusIdValidator(status) == state.data.data![index].orderStatusId) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1, 0),
                          end: const Offset(0, 0),
                        ).animate(animation),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<OrderDetailPage>(
                                builder: (context) => OrderDetailPage(),
                              ),
                            );
                          },
                          child: OrderItemWidget(
                            data: state.data.data![index],
                            status: status,
                            animation: Tween<Offset>(
                              begin: const Offset(1, 0),
                              end: const Offset(0, 0),
                            ).animate(animation),
                            key: Key('$index'),
                          ),
                        ),
                      );
                    } else if (status == OrderStatus.all) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1, 0),
                          end: const Offset(0, 0),
                        ).animate(animation),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<OrderDetailPage>(
                                builder: (context) => OrderDetailPage(),
                              ),
                            );
                          },
                          child: OrderItemWidget(
                            data: state.data.data![index],
                            status: status,
                            animation: Tween<Offset>(
                              begin: const Offset(1, 0),
                              end: const Offset(0, 0),
                            ).animate(animation),
                            key: Key('$index'),
                          ),
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                  initialItemCount: state.data.data!.length,
                );
        } else {
          return EmptyDataWidget();
        }
      },
    );
  }
}
