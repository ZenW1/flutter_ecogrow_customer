import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_cache_image_widget.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget(
      {required this.categoryItemModel, required this.onTap, super.key,});

  final CategoryItemModel categoryItemModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: Dimensions.paddingSizeDefault()),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault()),
          border: Border.all(
            color: AppColors.greyColor,
            width: 0.15,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radiusDefault()),
                  topRight: Radius.circular(Dimensions.radiusDefault()),
                ),
              ),
              child: CustomCacheImageWidget(
                imageUrl: categoryItemModel.imageUrl,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Dimensions.paddingSizeSmall()),
              child: Text(
                categoryItemModel.title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItemModel {

  const CategoryItemModel({required this.title, required this.imageUrl});
  final String title;
  final String imageUrl;
}
