import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/product_detail/cubit/product_selection/product_selection_cubit.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

class ProductPriceDetailWidget extends StatelessWidget {
  const ProductPriceDetailWidget({
    super.key,
    required this.title,
    required this.category,
    required this.condition,
    required this.price,
    required this.discount,
    required this.priceAfterDiscount,
    required this.stockQuantity,
  });

  final String title;
  final String category;
  final String condition;
  final String price;
  final String discount;
  final String priceAfterDiscount;
  final String stockQuantity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSelectionCubit, ProductSelectionState>(
      builder: (context, state) {
        return Container(
          color: AppColors.whiteColor,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Text(
                category,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              // const SizedBox(height: 16),
              // Row(
              //   children: [
              //     Text.rich(
              //       TextSpan(
              //         text: 'Condition : ',
              //         style: Theme.of(context).textTheme.bodyMedium,
              //         children: [
              //           TextSpan(
              //             text: condition,
              //             style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              //                   color: Theme.of(context).primaryColor,
              //                 ),
              //           ),
              //         ],
              //       ),
              //     ),
              //     const Spacer(),
              //     Icon(
              //       Icons.favorite,
              //       color: Theme.of(context).primaryColor,
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    '៛${state.priceAfterSelection}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.redColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                  ),
                  const SizedBox(width: 16),
                  discount.isNotEmpty || discount == ''
                      ? Text(
                          '៛${price}',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.grey.shade600,
                                    decorationThickness: 2,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                  ),
                        )
                      : const SizedBox(),
                  const SizedBox(width: 16),
                  discount.isNotEmpty || discount == ''
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.redColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${discount}% OFF',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Stock Quantity: $stockQuantity',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.primary,
                    ),
              )
            ],
          ),
        );
      },
    );
  }
}
