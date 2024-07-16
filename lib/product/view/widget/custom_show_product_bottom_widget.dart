import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_cache_image_widget.dart';

extension CustomProductShowButtomSheet on BuildContext {
  static Future<void> showBottomSheet(BuildContext context) async {
    return showModalBottomSheet(
      barrierColor: Colors.black.withOpacity(0.5),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: 350,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 130,
                            height: 110,
                            child: CustomCacheImageWidget(
                              imageUrl:
                                  'https://image.oppo.com/content/dam/oppo/common/mkt/v2-2/a79-5g-en/listpage/a79-5g-427_600-green.png.thumb.webp',
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Laneige Lip Sleeping Mask\n EX - Grapefruit (20g)',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: Dimensions.paddingSizeExtraSmall(),
                                  ),
                                  const Text(
                                    'Grape Flavor',
                                    style: TextStyle(fontSize: 12, color: AppColors.greyColor),
                                  ),
                                  SizedBox(
                                    height: Dimensions.paddingSizeExtraSmall(),
                                  ),
                                ],
                              ),
                              const Text(
                                r'$299',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.redColor),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child:  CircleAvatar(
                                radius: 15,
                                backgroundColor: AppColors.greyColor.withOpacity(0.1),
                                child: const Icon(
                                  Icons.close_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.paddingSizeSmall(),
                      ),
                      // AppTitle(
                      //   text: 'Select Color',
                      //   fontColor: Colors.black,
                      // ),
                      SizedBox(
                        height: Dimensions.paddingSizeSmall(),
                      ),
                      // countProductWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      // countProductWidget(),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        const AppTitleWidget(
                          text: 'Total Price',
                          fontColor: Colors.black,
                          isRow: true,
                          widget: Text(
                            r'$598',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: AppButton.roundedFilledButton(
                                context,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                text: 'Add To Cart',
                                textColor: Colors.white,
                                // color: AppColors.primaryColor,
                                backgroundColor: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: AppButton.roundedFilledButton(
                                context,
                                onTap: () {},
                                text: 'Check out',
                                backgroundColor: AppColors.primary,
                                textColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
