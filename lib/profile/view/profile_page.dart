import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/gen/assets.gen.dart';

import 'package:flutter_ecogrow_customer/profile/profile.dart';
import 'package:flutter_ecogrow_customer/profile/view/profile_item_widget.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_cache_image_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String routePath = '/profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  delegate: CustomerProfileHeader(),
                  pinned: true,
                  floating: true,
                ),
                SliverList.list(
                  children: [
                    ProfileItemWidget(
                      title: 'My Order',
                      onTap: () {},
                      icon: Assets.svg.myOrder,
                    ),
                    ProfileItemWidget(
                      title: 'Promotion',
                      onTap: () {},
                      icon: Assets.svg.privacy,
                    ),
                    ProfileItemWidget(
                      title: 'Wishlist',
                      onTap: () {},
                      icon: Assets.svg.wishlist,
                    ),
                    ProfileItemWidget(
                      title: 'Delivery Address',
                      onTap: () {},
                      icon: Assets.svg.deliveryAddress,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    mainTitleWidget(
                      context,
                      title: 'Wallets',
                    ),
                    ProfileItemWidget(
                      title: 'Wallets',
                      onTap: () {},
                      icon: Assets.svg.wallet,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    mainTitleWidget(
                      context,
                      title: 'Membership',
                    ),
                    ProfileItemWidget(
                      title: 'Membership',
                      onTap: () {},
                      icon: Assets.svg.memberShip,
                    ),
                    ProfileItemWidget(
                      title: 'Store Register',
                      onTap: () {},
                      icon: Assets.svg.store,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    mainTitleWidget(
                      context,
                      title: 'Setting',
                    ),
                    ProfileItemWidget(
                      title: 'Notifications',
                      onTap: () {},
                      icon: Assets.svg.notification,
                    ),
                    ProfileItemWidget(
                      title: 'Language',
                      onTap: () {
                        GoRouter.of(context).push('/language');
                      },
                      icon: Assets.svg.language,
                    ),
                    mainTitleWidget(
                      context,
                      title: 'Support',
                    ),
                    ProfileItemWidget(
                      title: 'About Us',
                      onTap: () {},
                      icon: Assets.svg.aboutUs,
                    ),
                    ProfileItemWidget(
                      title: 'Privacy Policy',
                      onTap: () {},
                      icon: Assets.svg.privacy,
                    ),
                    ProfileItemWidget(
                      title: 'Term & Condition',
                      onTap: () {},
                      icon: Assets.svg.termCondition,
                    ),
                    ProfileItemWidget(
                      title: 'Help Center',
                      onTap: () {},
                      icon: Assets.svg.helpCenter,
                    ),
                    ProfileItemWidget(
                      title: 'FAQ',
                      onTap: () {},
                      icon: Assets.svg.faq,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget mainTitleWidget(BuildContext context, {required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.blackColor,
                ),
          ),
        ),
      ],
    );
  }
}

class CustomerProfileHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final shrinkPercentage = shrinkOffset / maxExtent;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 30,
            child: CustomCacheImageWidget(
              imageUrl: 'https://via.placeholder.com/150',
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
              const Text('Hi GoatJo'),
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
            onTap: () {},
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
    return true;
  }
}
