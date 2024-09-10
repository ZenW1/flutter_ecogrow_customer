import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_constant_widget.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_bar_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_cache_image_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_container_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/my_separate.dart';
import 'package:flutter_ecogrow_customer/shared/widget/text_row_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  static const String routePath = '/payment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Payment',
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            AppTitleWidget(text: 'Summary Payment'),
            const SizedBox(
              height: 10,
            ),
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
            const SizedBox(
              height: 16,
            ),
            AppTitleWidget(text: 'Payment Method'),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              decoration: CustomConstantWidget.shadowBoxDecorationWidget(),
              child: Column(
                children: [
                  SizedBox(height: 5,),
                  AppTitleWidget(text: 'Online Payment'),
                  CustomContainerWidget(
                    title: 'ABA KHQR ',
                    subTitle: 'Scan to pay with ABA',
                    leading: CustomCacheImageWidget(
                      imageUrl: 'https://yt3.googleusercontent.com/ytc/AIdro_ljV-vXKHv8x9yHY_Z6RuI9jutIh6f8D0O1oYIY43fJiNo=s900-c-k-c0x00ffffff-no-rj',
                      width: 50,
                      height: 50,
                    ),
                    trialing: Radio(
                      value: 'aba',
                      groupValue: 'aba',
                      onChanged: (value) {},
                    ),
                     isShowDecoration: false,
                  ),
                  SizedBox(height: 5,),
                  AppTitleWidget(text: 'Manual Payment'),
                  CustomContainerWidget(
                    title: 'Cash Payment ',
                    subTitle: 'Pay with cash',
                    leading: CustomCacheImageWidget(
                      imageUrl: 'https://static.vecteezy.com/system/resources/previews/012/184/580/original/cash-payment-outline-color-icon-vector.jpg',
                      width: 50,
                      height: 50,
                    ),
                    trialing: Radio(
                      value: 'cash',
                      groupValue: 'cash',
                      onChanged: (value) {},
                    ),
                    isShowDecoration: false,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 32,
        ),
        child: AppButton.roundedFilledButton(context, onTap: (){}, text: 'Pay Now'),
      ),
    );
  }
}
