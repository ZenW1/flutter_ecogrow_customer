import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/cart/view/widget/cart_product_widget.dart';
import 'package:flutter_ecogrow_customer/data/model/cart_model.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({required this.data, super.key});

  final CartModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          Dimensions.paddingSizeDefault(),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: false,
                onChanged: (bool? value) {},
                shape: const CircleBorder(
                  side: BorderSide(color: AppColors.primary),
                ),
                side: const BorderSide(color: AppColors.primary),
                activeColor: AppColors.primary,
              ),
              Expanded(
                child: Text(
                  data.storeName,
                ),
              ),
            ],
          ),
          ListView.separated(
            itemCount: 2,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CartProductWidget(
                data: data.products[index],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: Dimensions.paddingSizeSmall(),
              );
            },
          ),
        ],
      ),
    );
  }
}
