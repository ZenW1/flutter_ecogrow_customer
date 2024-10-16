import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/authentication/authentication_bloc.dart';
import 'package:flutter_ecogrow_customer/gen/assets.gen.dart';
import 'package:flutter_ecogrow_customer/l10n/l10n.dart';
import 'package:flutter_ecogrow_customer/location/location.dart';
import 'package:flutter_ecogrow_customer/login/cubit/login_cubit.dart';
import 'package:flutter_ecogrow_customer/main/main.dart';

import 'package:flutter_ecogrow_customer/profile/profile.dart';
import 'package:flutter_ecogrow_customer/profile/view/profile_item_widget.dart';
import 'package:flutter_ecogrow_customer/profile/view/widget/profile_unauthenticate_widget.dart';
import 'package:flutter_ecogrow_customer/route/app_router.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_profile_header_widgt.dart';
import 'package:flutter_ecogrow_customer/shared/widget/dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String routePath = '/profile';

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.loading) {
          context.loaderOverlay.show();
        } else if (state.status == LoginStatus.loginOut) {
          context.loaderOverlay.hide();
          AppRouter.router.push(MainPage.routePath);
        }
      },
      child: context.read<AuthenticationBloc>().appToken.hasToken()
          ? const ProfileView()
          : const ProfileAuthenticateWidget(),
    );
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    context.read<ProfileCubit>().fetchUserInfo();
    super.initState();
  }

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
                child: CustomProfileHeader(),
              ),
              SliverList.list(
                children: [
                  ProfileItemWidget(
                    title: context.l10n.myOrder,
                    onTap: () {},
                    icon: Assets.svg.myOrder,
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
                        AppDialog.questionDialog(context,
                            content: 'Are you sure , logging out . Your carts item will be deleted', onYes: () {
                          context.read<LoginCubit>().signOut();
                        });
                      },
                      icon: Assets.svg.signout,
                    ),
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

  @override
  bool get wantKeepAlive => true;
}
