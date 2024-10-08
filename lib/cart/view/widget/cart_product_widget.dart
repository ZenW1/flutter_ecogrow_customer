import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/data/model/cart_list_response_model.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

import 'package:flutter_ecogrow_customer/shared/widget/custom_cache_image_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_icon_widget.dart';

class CartProductWidget extends StatefulWidget {
  const CartProductWidget(
      {required this.data,
      super.key,
      required this.value,
      required this.index,
      required this.onChanged,
      required this.onIncrease,
      required this.onDecrease,
      required this.quantityValue});

  final CartProductModel data;

  final List<bool> value;
  final int index;
  final Function(bool? value) onChanged;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final int quantityValue;

  @override
  State<CartProductWidget> createState() => _CartProductWidgetState();
}

class _CartProductWidgetState extends State<CartProductWidget> {
  late int value = int.parse(widget.data.quantity!);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: widget.onChanged,
                shape: const CircleBorder(
                  side: BorderSide(color: AppColors.primary),
                ),
                side: const BorderSide(color: AppColors.primary),
                activeColor: AppColors.primary,
              ),
              SizedBox(
                width: Dimensions.paddingSizeExtraSmall(),
              ),
              SizedBox(
                height: 90,
                width: 90,
                child: CustomCacheImageWidget(
                  imageUrl: widget.data.productImage!,
                  radius: 10,
                ),
              ),
              SizedBox(
                width: Dimensions.paddingSizeSmall(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.data.productName!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            '\$${widget.data.price!}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.redColor,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '\$${widget.data.discount!}',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: AppColors.greyColor,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                Dimensions.paddingSizeExtraSmall(),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 2.0),
                              child: Text(
                                widget.data.unitType!,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            right: 12,
            bottom: 12,
            child: Row(
              children: [
                CustomCircleIcon(
                    radius: 15,
                    onTap: widget.onDecrease,
                    icon: CupertinoIcons.minus),
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimensions.paddingSizeExtraSmall(),
                    ),
                    border: Border.all(
                      color: AppColors.primary,
                      width: 0.8,
                    ),
                  ),
                  child: AnimatedFlipCounter(
                    value: widget.quantityValue,
                    // child: Text(
                    //   ,
                    //   style: const TextStyle(
                    //     color: AppColors.primary,
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),
                  ),
                ),
                CustomCircleIcon(
                    radius: 15,
                    onTap: widget.onIncrease,
                    icon: CupertinoIcons.add),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
