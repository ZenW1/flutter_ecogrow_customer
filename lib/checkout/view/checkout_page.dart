import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ecogrow_customer/checkout/checkout.dart';
import 'package:flutter_ecogrow_customer/checkout/view/payment_page.dart';
import 'package:flutter_ecogrow_customer/home/view/home_page.dart';
import 'package:flutter_ecogrow_customer/product/view/widget/product_sort_list_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_constant_widget.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_bar_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_container_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/global_text_field.dart';
import 'package:flutter_ecogrow_customer/shared/widget/my_separate.dart';
import 'package:flutter_ecogrow_customer/shared/widget/text_row_widget.dart';
import 'package:go_router/go_router.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  static const String routePath = '/checkout';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CheckoutCubit(),
      child: const CheckoutView(),
    );
  }
}

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const AppBarWidget(
            title: 'Checkout',
          ),
          body: SizedBox(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  AppTitleWidget(
                    text: 'Delivery Address',
                    isRow: true,
                    widget: Text(
                      'Edit',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.primary,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomContainerWidget(
                    title: 'Delivery',
                    subTitle: 'We’ll deliver your order to your place ',
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      radius: 16,
                      child: Icon(
                        Icons.location_on,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    trialing: SizedBox(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const AppTitleWidget(
                    text: 'Shipping Method',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomContainerWidget(
                    title: 'Delivery Address',
                    subTitle: r'Free shipping for orders over $50',
                    leading: Radio(
                      value: 1,
                      groupValue: 1,
                      onChanged: (value) {},
                    ),
                    trialing: Text(
                      r'$5.00',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.redColor,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GlobalTextField(
                    textInputType: TextInputType.text,
                    controller: TextEditingController(),
                    hintText: 'Add a note to your order',
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const AppTitleWidget(text: 'Product (7)'),
                  const SizedBox(
                    height: 16,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: context.read<CheckoutCubit>().data.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = context.read<CheckoutCubit>().data[index];
                      return ProductListWidget(
                        product: ProductModel(
                          name: data.name,
                          price: data.price,
                          imageUrl: data.imageUrl,
                          weight: data.weight,
                          quantity: data.quantity,
                        ),
                      );
                    },
                  ),
                  const MySeparator(),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 12,
                    ),
                    decoration: CustomConstantWidget.shadowBoxDecorationWidget(
                      radius: 20,
                    ),
                    child:  Column(
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
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 32,
              top: 16,
            ),
            decoration: CustomConstantWidget.shadowBoxDecorationWidget(
              radius: 20,
            ),
            child: AppButton.roundedFilledButton(
              context,
              onTap: () {
                GoRouter.of(context).push(PaymentPage.routePath);
              },
              text: 'Payment',
            ),
          ),
        );
      },
    );
  }
}
