import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ecogrow_customer/login/login.dart';
import 'package:flutter_ecogrow_customer/login/view/otp_page.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/global_text_field.dart';
import 'package:go_router/go_router.dart';

import '../../gen/assets.gen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String routePath = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ECOGROW',
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                              fontSize: 24,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Explore our wide range of fresh produce, organic groceries, and eco-friendly good',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Center(
                            child: Image.asset(
                              Assets.images.otp1.path,
                              width: 135,
                              height: 110,
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          const AppTitleWidget(
                            text: 'Enter your mobile number',
                            fontColor: AppColors.blackColor,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GlobalTextField(
                            textInputType: TextInputType.number,
                            controller:
                            context.read<LoginCubit>().numberController,
                            hintText: 'Phone Number',
                            filled: true,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: AppButton.roundedFilledButton(
                              context,
                              onTap: () {
                                GoRouter.of(context).go(OTPPage.routePath);
                              },
                              text: 'Continue',
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
