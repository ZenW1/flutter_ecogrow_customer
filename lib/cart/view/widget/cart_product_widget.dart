import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/cart/bloc/cart_bloc.dart';
import 'package:flutter_ecogrow_customer/cart/cart_selection/cart_selection_cubit.dart';
import 'package:flutter_ecogrow_customer/data/model/cart_list_response_model.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

import 'package:flutter_ecogrow_customer/shared/widget/custom_cache_image_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_icon_widget.dart';

class CartProductWidget extends StatefulWidget {
  const CartProductWidget({
    required this.data,
    super.key,
    required this.value,
    required this.index,
    required this.onChanged,
    required this.secondIndex,
  });

  final CartProductModel data;
  final int secondIndex;

  final bool? value;
  final int index;
  final Function(bool? value) onChanged;

  @override
  State<CartProductWidget> createState() => _CartProductWidgetState();
}

class _CartProductWidgetState extends State<CartProductWidget> {
  int count = 1;

  bool? valueChange = false;

  @override
  void initState() {
    count = int.parse(widget.data.quantity!);
    valueChange = widget.data.selected!;
    super.initState();
  }

  void onDecrease(int index, int secondIndex, int count) {
    count--;
    // context.read<CartBloc>().add(CartUpdateQuantity(quantity: count , index: index,secondIndex: secondIndex));
  }

  void onIncrease(int index, int secondIndex, int count) {
    count++;
    context.read<CartBloc>().add(CartUpdateQuantity(quantity: count, index: index, secondIndex: secondIndex));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartSelectionCubit, CartSelectionState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Stack(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: state.isSelected,
                    onChanged: (bool? value) {},
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
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                '\$${widget.data.price!}',
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: AppColors.redColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                '\៛${widget.data.discount ?? ''}',
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
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
                        onTap: () {
                          if (count > 1) {
                            setState(() {
                              count--;
                              onDecrease(widget.index, widget.secondIndex, count);
                            });
                          }
                        },
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
                        value: count,
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
                        onTap: () {
                          widget.onChanged(false);
                          setState(() {
                            count++;
                            onIncrease(widget.index, widget.secondIndex, count);
                          });
                        },
                        icon: CupertinoIcons.add),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
