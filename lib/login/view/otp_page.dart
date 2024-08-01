import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/gen/assets.gen.dart';
import 'package:flutter_ecogrow_customer/l10n/l10n.dart';
import 'package:flutter_ecogrow_customer/login/view/widget/custom_pin_put_widget.dart';
import 'package:flutter_ecogrow_customer/register/register.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:go_router/go_router.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({super.key});
  static const String routePath = '/otp';

  @override
  Widget build(BuildContext context) {

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
                        context.l10n.verifyOtp,
                        textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 24, color: AppColors.primary),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        context.l10n.verifyOtpDescription,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Center(
                        child: Image.asset(
                          Assets.images.otp2.path,
                          width: 135,
                          height: 110,
                        ),
                      ),
                      const SizedBox(
                        height: 55,
                      ),
                      Center(
                        child: CustomPinPutWidget(
                          controller: TextEditingController(),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            context.l10n.didNOtReceiveOtp,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              context.l10n.resendOtp,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: AppColors.redColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: AppButton.roundedFilledButton(
                          context,
                          onTap: () {
                            context.go(RegisterPage.routePath);
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
  }
}
