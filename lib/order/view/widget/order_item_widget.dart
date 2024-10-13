import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/data/model/order_detail_response_model.dart';
import 'package:flutter_ecogrow_customer/data/model/order_item_model.dart';
import 'package:flutter_ecogrow_customer/data/model/store_model.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_constant_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/validator_extension.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_row_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/store_item_widget.dart';

class OrderItemWidget extends StatefulWidget {
  const OrderItemWidget({
    required this.data,
    super.key,
    required this.animation,
    required this.status,
  });

  final OrderDetailModel data;
  final OrderStatus status;
  final Animation<Offset> animation;

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget>
    with SingleTickerProviderStateMixin {
  double opacity = 0.1;
  AnimationController? animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant OrderItemWidget oldWidget) {
    if (oldWidget.data != widget.data) {
      animationController!.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (context, child) {
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          decoration: CustomConstantWidget.shadowBoxDecorationWidget(),
          height: MediaQuery
              .of(context)
              .size
              .height * 0.187,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomRowWidget(
                leftWidget: Text(
                  '${widget.data.orderCode}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                rightWidget: Text(widget.data.orderDate!.toString(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium),
              ),
              const Divider(
                color: AppColors.lightGreyColor,
              ),
              CustomRowWidget(
                leftWidget: Text(
                  'QTY : ${widget.data.getOrderDetail!.fold(
                      0, (previousValue, element) => previousValue + element.qty!)}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge,
                ),
                rightWidget: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Total : ',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyLarge,
                      ),
                      TextSpan(
                        text: r'៛' + widget.data.grandTotal.toString(),
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
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
                data: StoreModel(
                    id: widget.data.sellerId.toString(),
                    storeName: widget.data.storeName!,
                    storeImage: '',
                    storeCategory: widget.data.sellerName!,
                    totalOrder: ''),
                trailingWidget: AppButton.roundedSidedButton(
                  context,
                  onTap: () {},
                  radius: 12,
                  height: 45,

                  text: ValidatorExtension.orderStatusValidator(widget.status),
                  textColor: ValidatorExtension.orderStatusValidatorColor(
                      widget.status),
                  color: ValidatorExtension.orderStatusValidatorColor(
                      widget.status),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
