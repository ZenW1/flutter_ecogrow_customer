import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ecogrow_customer/data/model/product_response_model.dart';
import 'package:flutter_ecogrow_customer/product_detail/view/product_detail_page.dart';
import 'package:flutter_ecogrow_customer/product_detail/view/widget/product_vertical_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';

class ProductPromotionView extends StatelessWidget {
  const ProductPromotionView({super.key, required this.data});

  final ProductResponseModel data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.paddingSizeSmall(),
      ),
      shrinkWrap: true,
      itemCount: data.data!.length,
      itemBuilder: (context, index) {
        return OpenContainer(
          transitionType: ContainerTransitionType.fadeThrough,
          tappable: true,
          transitionDuration: Duration(milliseconds: 300),
          openColor: Colors.white,
          closedColor: Colors.white,
          closedElevation: 0,
          openElevation: 0,
          openShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          middleColor: Colors.white,
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          openBuilder: (context, __) {
            return ProductDetailPage();
          },
          closedBuilder: (BuildContext context, VoidCallback openContainer) {
            return Container(
              width: 200,
              child: ProductVerticalWidget(
                onTap: () {
                  openContainer();
                },
                product: data.data![index],
                isPromotion: true,
              ),
            );
          },
        );
      },
    );
  }
}
