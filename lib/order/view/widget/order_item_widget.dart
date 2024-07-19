import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/data/model/order_item_model.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_constant_widget.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_row_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/store_item_widget.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({
    required this.data,
    super.key,
  });

  final OrderItemModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      decoration: CustomConstantWidget.shadowWidget(),
      height: MediaQuery.of(context).size.height * 0.177,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CustomRowWidget(
            leftWidget: Text(
              '#${data.id}',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            rightWidget: Text(data.dateTime),
          ),
          const Divider(
            color: AppColors.lightGreyColor,
          ),
          CustomRowWidget(
            leftWidget: Text(
              'QTY : ${data.qty}',
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
                    text: r'$' + data.totalPrice,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          StoreItemWidget(
            data: data.store,
            trailingWidget: AppButton.roundedSidedButton(
              context,
              onTap: () {},
              text: 'Ordering',
              color: AppColors.yellowColor,
            ),
          ),
        ],
      ),
    );
  }
}
