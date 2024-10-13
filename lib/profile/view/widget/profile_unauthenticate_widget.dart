import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/gen/assets.gen.dart';
import 'package:flutter_ecogrow_customer/l10n/l10n.dart';
import 'package:flutter_ecogrow_customer/location/location.dart';
import 'package:flutter_ecogrow_customer/login/cubit/login_cubit.dart';
import 'package:flutter_ecogrow_customer/login/login.dart';
import 'package:flutter_ecogrow_customer/main/main.dart';

import 'package:flutter_ecogrow_customer/profile/profile.dart';
import 'package:flutter_ecogrow_customer/profile/view/profile_item_widget.dart';
import 'package:flutter_ecogrow_customer/route/app_router.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_profile_header_widgt.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';


class ProfileAuthenticateWidget extends StatelessWidget {
  const ProfileAuthenticateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<ProfileCubit>().fetchUserInfo();
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.grey.withOpacity(0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: 'profile',
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage: Image.network(
                            'https://www.w3schools.com/howto/img_avatar.png',
                            fit: BoxFit.cover,
                          ).image,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AppButton.roundedFilledButton(
                        context,
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 45,
                        onTap: () {
                           Navigator.of(context).push(
                             MaterialPageRoute(builder: (context) => LoginPage())
                           );
                        },
                        text: 'Login Now',
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text('${userModel.firstName} ${userModel.lastName}' ?? ''),
                      //     Text.rich(
                      //       style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      //         color: AppColors.greyColor,
                      //       ),
                      //       const TextSpan(
                      //         text: '10 Orders',
                      //         children: [
                      //           TextSpan(
                      //             text: '. 0 wishlist',
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
              SliverList.list(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  // mainTitleWidget(
                  //   context,
                  //   title: context.l10n.wallet,
                  // ),
                  // ProfileItemWidget(
                  //   title: context.l10n.wallet,
                  //   onTap: () {},
                  //   icon: Assets.svg.wallet,
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  mainTitleWidget(
                    context,
                    title: context.l10n.setting,
                  ),
                  ProfileItemWidget(
                    title: context.l10n.language,
                    onTap: () {
                      GoRouter.of(context).push('/language');
                    },
                    icon: Assets.svg.language,
                  ),
                  mainTitleWidget(
                    context,
                    title: context.l10n.support,
                  ),
                  ProfileItemWidget(
                    title: context.l10n.aboutUs,
                    onTap: () {},
                    icon: Assets.svg.aboutUs,
                  ),
                  ProfileItemWidget(
                    title: context.l10n.privacyPolicy,
                    onTap: () {
                      GoRouter.of(context).push('/privacy');
                    },
                    icon: Assets.svg.privacy,
                  ),
                  ProfileItemWidget(
                    title: context.l10n.termCondition,
                    onTap: () {
                      GoRouter.of(context).push('/term-condition');
                    },
                    icon: Assets.svg.termCondition,
                  ),
                  ProfileItemWidget(
                    title: context.l10n.helpCenter,
                    onTap: () {},
                    icon: Assets.svg.helpCenter,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
