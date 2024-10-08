import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/data/model/product_detail_response_model.dart';
import 'package:flutter_ecogrow_customer/product_detail/cubit/product_selection/product_selection_cubit.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';

class ProductSelectionDetailWidget extends StatefulWidget {
  const ProductSelectionDetailWidget(
      {super.key, required this.productVariation});

  final ProductDetailResponseModel productVariation;

  @override
  State<ProductSelectionDetailWidget> createState() =>
      _ProductSelectionDetailWidgetState();
}

class _ProductSelectionDetailWidgetState
    extends State<ProductSelectionDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSelectionCubit, ProductSelectionState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(16),
          color: AppColors.whiteColor,
          child: Column(
            children: [
              AppTitleWidget(
                text: 'Select Options',
                isRow: false,
              ),
              Text(state.totalPrice.toString()),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // margin: EdgeInsets.symmetric(horizontal: 16),
                            height: 45,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: widget
                                  .productVariation.productVariation?.length,
                              itemBuilder: (_, index) {
                                return InkWell(
                                  onTap: () {
                                    context
                                        .read<ProductSelectionCubit>()
                                        .selectOption(widget.productVariation
                                            .productVariation![index]);
                                  },
                                  child: SizedBox(
                                    width: 60,
                                    height: 45,
                                    child: Card(
                                      elevation: 0,
                                      color: state.isSelectedOption[index]
                                          ? AppColors.primary
                                          : AppColors.lightGreyColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: Text(
                                          widget
                                              .productVariation
                                              .productVariation![index]
                                              .unitTypeName!,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: state
                                                        .isSelectedOption[index]
                                                    ? AppColors.whiteColor
                                                    : AppColors.blackColor,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
