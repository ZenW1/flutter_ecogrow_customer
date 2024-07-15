import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/home/view/home_page.dart';
import 'package:flutter_ecogrow_customer/product/view/widget/custom_show_product_bottom_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_cache_image_widget.dart';

class ProductVerticalWidget extends StatelessWidget {

   const ProductVerticalWidget({super.key,required this.product});

   final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(2, 2),
            blurRadius: 3,
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall()),
            margin: EdgeInsets.only(left: Dimensions.paddingSizeSmall()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Dimensions.paddingSizeSmall(),
                ),
                 SizedBox(
                  width: 150,
                  height: 120,
                  child: CustomCacheImageWidget(
                    imageUrl:
                         product.imageUrl,
                  ),
                ),
                SizedBox(
                  height: Dimensions.paddingSizeDefault(),
                ),
                 Text(
                   product.name,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: Dimensions.paddingSizeExtraSmall(),
                ),
                 Text(
                   '\$${product.price}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: AppColors.redColor),
                ),
                SizedBox(
                  height: Dimensions.paddingSizeExtraSmall(),
                ),
                // ShaderMask(
                //   blendMode: BlendMode.srcIn,
                //   shaderCallback: (Rect bounds) {
                //     return AppColors.primaryGradient.createShader(bounds);
                //   },
                //   child: Text(
                //     '\$299',
                //     style: TextStyle(
                //       fontSize: 14,
                //       fontWeight: FontWeight.w600,
                //     ),
                //   ),
                //     Text(
                //       '\$299',
                //       style: TextStyle(
                //         fontSize: 14,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     )
                // ),
                 Text(
                  'Condition : ${product.condition}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
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
                  CustomProductShowButtomSheet.showBottomSheet(context);
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
