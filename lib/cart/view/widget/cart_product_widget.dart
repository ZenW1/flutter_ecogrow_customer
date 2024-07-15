import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/data/model/cart_model.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

import 'package:flutter_ecogrow_customer/shared/widget/custom_cache_image_widget.dart';

class CartProductWidget extends StatelessWidget {
  const CartProductWidget({required this.data, super.key});

  final CartProductModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
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
          SizedBox(
            width: Dimensions.paddingSizeExtraSmall(),
          ),
          Expanded(
            child: SizedBox(
              height: 90,
              width: 90,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  Dimensions.paddingSizeDefault(),
                ),
                child: CustomCacheImageWidget(
                  imageUrl: data.productImage,
                ),
              ),
            ),
          ),
          SizedBox(
            width: Dimensions.paddingSizeSmall(),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              data.productName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Container(
                              width: 100,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Dimensions.paddingSizeSmall(),
                                ),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                  width: 0.4,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: const Center(
                                      child: Icon(
                                        CupertinoIcons.delete_solid,
                                        color: AppColors.redColor,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  VerticalDivider(
                                    color: Colors.grey.withOpacity(0.5),
                                    thickness: 0.5,
                                    width: 0.5,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      data.productQuantity,
                                      style: const TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  VerticalDivider(
                                    color: Colors.grey.withOpacity(0.5),
                                    thickness: 0.5,
                                    width: 0.5,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: const Center(
                                      child: Icon(
                                        CupertinoIcons.add,
                                        color: AppColors.primary,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data.productQuantity,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '\$${data.productPrice}',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.redColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
