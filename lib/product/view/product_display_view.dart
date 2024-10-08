import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/data/model/product_response_model.dart';
import 'package:flutter_ecogrow_customer/product_detail/view/widget/product_vertical_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';
import 'package:go_router/go_router.dart';

import '../../product_detail/product_detail.dart';

class ProductDisplayView extends StatelessWidget {
  const ProductDisplayView({super.key, required this.data});

  final ProductResponseModel data;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.paddingSizeSmall(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: data.data!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // CustomProductShowButtomSheet.showBottomSheet;
          },
          child: ProductVerticalWidget(
            onTap: () {
              GoRouter.of(context).push(ProductDetailPage.routePath);
            },
            product: data.data![index],
            isPromotion: false,
          ),
        );
      },
    );
  }
}
