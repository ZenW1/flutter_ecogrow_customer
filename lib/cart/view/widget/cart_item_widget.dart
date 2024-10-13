import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/cart/bloc/cart_bloc.dart';
import 'package:flutter_ecogrow_customer/cart/cart.dart';
import 'package:flutter_ecogrow_customer/cart/cart_selection/cart_selection_cubit.dart';
import 'package:flutter_ecogrow_customer/cart/view/widget/cart_product_widget.dart';
import 'package:flutter_ecogrow_customer/data/model/cart_list_response_model.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_constant_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    required this.data,
    super.key,
    required this.index,
  });

  final CartModel data;
  final int index;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  bool? valueChange = false;
  int count = 1;

  @override
  void initState() {
    valueChange = widget.data.totalSelected!;
    super.initState();
  }

  void onDecrease(int index, int secondIndex, int count) {
    count--;
    context.read<CartBloc>().add(CartUpdateQuantity(quantity: count, index: index, secondIndex: secondIndex));
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
          decoration: CustomConstantWidget.shadowBoxDecorationWidget(
            radius: 15,
            color: AppColors.whiteColor,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: state.isAllSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        state.isAllSelected = value!;
                        if(state.isAllSelected == true){
                          context.read<CartSelectionCubit>().selectAll();
                          context.read<CartSelectionCubit>().addCartListResponseModel(
                            widget.data
                          );
                          context.read<CartSelectionCubit>().totalSelectPrice(widget.data.totalPrice!);
                          // context.read<CartSelectionCubit>().totalQuantity(widget.data.!);
                        } else if(state.isAllSelected == false){
                          context.read<CartSelectionCubit>().deselectAll();
                          context.read<CartSelectionCubit>().removeCartListResponseModel();
                        }
                        // if(state.isAllSelected == true){
                        //   context.read<CartSelectionCubit>().selectAll();
                        //   context.read<CartSelectionCubit>().addCartListResponseModel(
                        //     widget.data
                        //   );
                        // }
                        // context.read<CartSelectionCubit>().selectAll();
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
                  return CartProductWidget(
                    data: widget.data.products![index],
                    value: widget.data.products![index].selected!,
                    secondIndex: index,
                    index: index,
                    onChanged: (bool? value) {},
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
      },
    );
  }
}
