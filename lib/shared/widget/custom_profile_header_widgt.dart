import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/data/model/user_info_model.dart';
import 'package:flutter_ecogrow_customer/gen/assets.gen.dart';
import 'package:flutter_ecogrow_customer/profile/view/profile_edit_page.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_cache_image_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CustomerProfileHeader extends SliverPersistentHeaderDelegate {

  CustomerProfileHeader(this.userModel);
  final UserModel userModel;
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final shrinkPercentage = shrinkOffset / maxExtent;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.grey.withOpacity(0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           CircleAvatar(
            radius: 30,
            child: CustomCacheImageWidget(
              imageUrl: userModel.image!,
              width: 80,
              height: 80,
              radius: 80,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text('${userModel.firstName} ${userModel.lastName}'),
              Text.rich(
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.greyColor,
                    ),
                const TextSpan(
                  text: '10 Orders',
                  children: [
                    TextSpan(
                      text: '. 0 wishlist',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              GoRouter.of(context).go(ProfileEditPage.routePath);
            },
            child: SvgPicture.asset(
              Assets.svg.edit,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
