import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/gen/assets.gen.dart';
import 'package:flutter_ecogrow_customer/l10n/l10n.dart';
import 'package:flutter_ecogrow_customer/login/login.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_dialog.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/global_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String routePath = '/login';

  @override
  Widget build(BuildContext context) {
    return LoginView();
  }
}

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.loading) {
          context.loaderOverlay.show();
        } else if (state.status == LoginStatus.sendOtp) {
          context.loaderOverlay.hide();
          GoRouter.of(context).go('/otp');
        } else if (state.status == LoginStatus.failure) {
          context.loaderOverlay.hide();
          CustomDialog.showWarningDialog(state.errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Form(
              key: _formKey,
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
                                    fontSize: 24, color: AppColors.primary),
                          ),
                          const SizedBox(
                            height: 20,
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
                          AppTitleWidget(
                            text: context.l10n.phoneNumber,
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
                            hintText: context.l10n.phoneNumber,
                            filled: true,
                            prefix: const PrefixNumberIcon(),
                            // labelText: context.l10n.phoneNumber,
                            autoFocus: true,
                            validator: (value) {
                              if (value == null) {
                                return context.l10n.enterPhoneNumber;
                              } else if (value.length < 7) {
                                return 'Please enter a valid phone number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: AppButton.roundedFilledButton(
                              context,
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  await context.read<LoginCubit>().sendLoginOtp(
                                        phoneNumber: context
                                            .read<LoginCubit>()
                                            .numberController
                                            .text,
                                      );
                                }
                              },
                              text: context.l10n.confirm,
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
