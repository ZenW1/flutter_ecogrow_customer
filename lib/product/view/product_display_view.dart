import 'package:animations/animations.dart';
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
          child: OpenContainer(
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
              return ProductDetailPage(
                id: data.data![index].id.toString(),
              );
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
          ),
        );
      },
    );
  }
}
