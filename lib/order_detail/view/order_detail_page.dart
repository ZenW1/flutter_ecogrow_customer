import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_constant_widget.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_bar_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_cache_image_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_container_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/my_separate.dart';
import 'package:flutter_ecogrow_customer/shared/widget/text_row_widget.dart';

import '../order_detail.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderDetailBloc(),
      child: const OrderDetailView(),
    );
  }
}

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailBloc, OrderDetailState>(
      builder: (context, state) {
        // TODO: return correct widget based on the state.
        return Scaffold(
          appBar: AppBarWidget(
            title: 'Order Detail',
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Order ID: ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          '123456',
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Order Date: ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          '12/12/2021',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping Address',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                        ),
                        Row(
                          children: [
                            Text(
                              'Name: ',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            Icon(
                              Icons.edit_location_outlined,
                              color: Colors.white,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTitleWidget(
                        text: 'Ordered Product',
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              'https://via.placeholder.com/150',
                              height: 100,
                              width: 100,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Product Name',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Unit Type : Kg',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                '៛1000',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            'X 1',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.redColor,
                                ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                // const AppTitleWidget(text: 'Product (7)'),
                // const SizedBox(
                //   height: 16,
                // ),
                // ListView.builder(
                //   shrinkWrap: true,
                //   itemCount: context.read<CheckoutCubit>().data.length,
                //   physics: const NeverScrollableScrollPhysics(),
                //   itemBuilder: (context, index) {
                //     final data = context.read<CheckoutCubit>().data[index];
                //     return ProductListWidget(
                //       product: ProductDummyModel(
                //         name: data.name,
                //         price: data.price,
                //         imageUrl: data.imageUrl,
                //         weight: data.weight,
                //         quantity: data.quantity,
                //       ),
                //     );
                //   },
                // ),
                // const MySeparator(),
                // const SizedBox(
                //   height: 16,
                // ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                  decoration: CustomConstantWidget.shadowBoxDecorationWidget(
                    radius: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // use khmer currency
                      AppTitleWidget(
                        text: 'Total',
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      TextRowWidget(
                        title: 'Order',
                        subTitle: '៛50000',
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      TextRowWidget(
                        title: 'Delivery Fee',
                        subTitle: '៛5000',
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      TextRowWidget(
                        title: 'Discount',
                        subTitle: '៛0',
                      ),
                      TextRowWidget(
                        title: 'Tax',
                        subTitle: '៛0',
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      MySeparator(),
                      SizedBox(
                        height: 11,
                      ),
                      TextRowWidget(
                        title: 'Total Payable',
                        titleStyle: Theme.of(context).textTheme.titleLarge,
                        subTitle: '៛55000',
                        subTitleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: AppColors.redColor,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: CustomConstantWidget.shadowBoxDecorationWidget(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      AppTitleWidget(text: 'Payment Method'),
                      CustomContainerWidget(
                        title: 'ABA KHQR ',
                        subTitle: 'Scan to pay with ABA',
                        leading: CustomCacheImageWidget(
                          imageUrl: 'https://yt3.googleusercontent.com/ytc/AIdro_ljV-vXKHv8x9yHY_Z6RuI9jutIh6f8D0O1oYIY43fJiNo=s900-c-k-c0x00ffffff-no-rj',
                          width: 50,
                          height: 50,
                        ),
                        isShowDecoration: false, trialing: SizedBox(),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      // AppTitleWidget(text: 'Manual Payment'),
                      // CustomContainerWidget(
                      //   title: 'Cash Payment ',
                      //   subTitle: 'Pay with cash',
                      //   leading: CustomCacheImageWidget(
                      //     imageUrl:
                      //     'https://static.vecteezy.com/system/resources/previews/012/184/580/original/cash-payment-outline-color-icon-vector.jpg',
                      //     width: 50,
                      //     height: 50,
                      //   ),
                      //   trialing: Radio(
                      //     value: 'cash',
                      //     groupValue: 'cash',
                      //     onChanged: (value) {},
                      //   ),
                      //   isShowDecoration: false,
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
