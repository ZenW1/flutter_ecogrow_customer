import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/gen/assets.gen.dart';
import 'package:flutter_ecogrow_customer/l10n/l10n.dart';
import 'package:flutter_ecogrow_customer/location/location.dart';
import 'package:flutter_ecogrow_customer/login/cubit/login_cubit.dart';

import 'package:flutter_ecogrow_customer/profile/profile.dart';
import 'package:flutter_ecogrow_customer/profile/view/profile_item_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_token.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_profile_header_widgt.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String routePath = '/profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(
        context.read<AppToken>()
      ),
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
               state is ProfileLoadSuccess ?
                SliverPersistentHeader(
                  delegate: CustomerProfileHeader(
                    state.data,
                  ),
                  pinned: false,
                  floating: false,
                ) : SliverToBoxAdapter(
                  child: Container(
                    height: 200,
                    color: AppColors.primary,
                  ),
                ),
                SliverList.list(
                  children: [
                    ProfileItemWidget(
                      title: context.l10n.myOrder,
                      onTap: () {},
                      icon: Assets.svg.myOrder,
                    ),
                    ProfileItemWidget(
                      title: context.l10n.promotion,
                      onTap: () {},
                      icon: Assets.svg.privacy,
                    ),
                    ProfileItemWidget(
                      title: context.l10n.wishlist,
                      onTap: () {},
                      icon: Assets.svg.wishlist,
                    ),
                    ProfileItemWidget(
                      title: context.l10n.deliveryAddress,
                      onTap: () {
                        context.push(LocationPage.routePath);
                      },
                      icon: Assets.svg.deliveryAddress,
                    ),
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
                      title: context.l10n.notification,
                      onTap: () {},
                      icon: Assets.svg.notification,
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
                      onTap: () {},
                      icon: Assets.svg.privacy,
                    ),
                    ProfileItemWidget(
                      title: context.l10n.termCondition,
                      onTap: () {},
                      icon: Assets.svg.termCondition,
                    ),
                    ProfileItemWidget(
                      title: context.l10n.helpCenter,
                      onTap: () {},
                      icon: Assets.svg.helpCenter,
                    ),
                    ProfileItemWidget(
                      title: context.l10n.faq,
                      onTap: () {},
                      icon: Assets.svg.faq,
                    ),
                    BlocListener<LoginCubit, LoginState>(
                      listener: (context, state) {
                        // if (state.status == LoginStatus.loading) {
                        //   context.loaderOverlay.show();
                        // } else if (state.status == LoginStatus.loginOut) {
                        //   _appToken.deleteToken();
                        //   context.loaderOverlay.hide();
                        //   AppRouter.router.push(LoginPage.routePath);
                        // }
                      },
                      child: ProfileItemWidget(
                        title: context.l10n.logout,
                        onTap: () {
                          context.read<LoginCubit>().signOut();
                        },
                        icon: Assets.svg.signout,
                      ),
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
