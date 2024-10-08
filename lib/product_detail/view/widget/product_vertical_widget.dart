import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/data/model/product_response_model.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_constant_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_cache_image_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/product_condition_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductVerticalWidget extends StatelessWidget {
  ProductVerticalWidget({
    required this.product,
    required this.onTap,
    this.isPromotion,
    super.key,
  });

  final ProductModel product;
  final VoidCallback onTap;
  bool? isPromotion = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: CustomConstantWidget.shadowBoxDecorationWidget(radius: 15, color: AppColors.whiteColor),
        child: Stack(
          children: [
            Container(
              // padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall()),
              margin: EdgeInsets.only(left: Dimensions.paddingSizeSmall()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Dimensions.paddingSizeSmall(),
                  ),
                  CustomCacheImageWidget(
                    width: 150,
                    height: 80,
                    imageUrl: product.image!,
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeDefault(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.productName!,
                        maxLines: 2,
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // conditionWidget(context),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeExtraSmall(),
                  ),
                  Text(
                    '\៛${product.price}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.redColor,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeExtraSmall(),
                  ),
                  Row(
                    children: [
                      Text(
                        'គុណភាព : ',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ProductConditionWidget(),
                    ],
                  ),
                ],
              ),
            ),
            isPromotion!
                ? Positioned(
                    top: 10,
                    left: 10,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset('assets/svg/promotion.svg'),
                        Text(
                          '20%',
                          style: TextStyle(color: AppColors.whiteColor, fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            !isPromotion!
                ? Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          // CustomProductShowButtomSheet.showBottomSheet(context,data: product);
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
