import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/home/home.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_constant_widget.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_cache_image_widget.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({required this.product, super.key});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: 80,
      decoration: CustomConstantWidget.shadowBoxDecorationWidget(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            CustomCacheImageWidget(
              imageUrl: product.imageUrl,
              width: 60,
              height: 60,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  product.weight.toString(),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.greyColor,
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'x ${product.quantity}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '៛${product.price}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.redColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
