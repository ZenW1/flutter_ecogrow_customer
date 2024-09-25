import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/cart/bloc/cart_bloc.dart';
import 'package:flutter_ecogrow_customer/cart/view/widget/cart_product_widget.dart';
import 'package:flutter_ecogrow_customer/data/model/cart_model.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_constant_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({required this.data, super.key});

  final CartListModel data;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {

  bool value = false;
  int count = 0;

   @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomConstantWidget.shadowBoxDecorationWidget(
        radius: 15,
        color: AppColors.whiteColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: value,
                onChanged: (bool? value) {
                   setState(() {
                    this.value = value!;
                   });
                },
                shape: const CircleBorder(
                  side: BorderSide(color: AppColors.primary),
                ),
                side: const BorderSide(color: AppColors.primary),
                activeColor: AppColors.primary,
              ),
              Expanded(
                child: Text(
                  widget.data.storeName!,
                ),
              ),
            ],
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.data.products!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              count = int.parse(widget.data.products![index].quantity!);
              return CartProductWidget(
                data: widget.data.products![index],
                value: [],
                index: index,
                onChanged: (bool? value) {  },
                onIncrease: () {
                  setState(() {
                    count = count +1;
                  });
                  // context.read<CartBloc>()..add(CartIncreaseEvent(value: int.parse(widget.data.products![index].quantity!), index: index));
                },
                onDecrease: () {
                  setState(() {
                    count = count! +1;
                  });
                },
                quantityValue: count,
              );
            },
            separatorBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: Dimensions.paddingSizeSmall(),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
