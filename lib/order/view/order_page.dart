import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ecogrow_customer/order/order.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_constant_widget.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_cache_image_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_row_widget.dart';

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
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Order'),
          ),
          body: Container(
            margin: const EdgeInsets.all(16),
            decoration: CustomConstantWidget.shadowWidget(),
            height: MediaQuery.of(context).size.height * 0.177,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CustomRowWidget(
                  leftWidget: Text(
                    '#1202384755',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  rightWidget: Text(' 05 Sep 2023 3:30PM'),
                ),
                Divider(
                  color: AppColors.lightGreyColor,
                ),
                CustomRowWidget(
                  leftWidget: Text(
                    'QTY : 3',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  rightWidget: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Total : ',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        TextSpan(
                          text: r'$50',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCacheImageWidget(
                        imageUrl: 'https://hillfresh.eu/wp-content/uploads/2021/12/aardbei-621x420.jpg',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Product 1',
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Electronic Store | ',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                  TextSpan(
                                    text: '54 Orders',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppButton.roundedSidedButton(
                        context,
                        onTap: () {},
                        text: 'Ordering',
                        color: AppColors.yellowColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
