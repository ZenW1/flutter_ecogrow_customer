import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_constant_widget.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

class CustomContainerWidget extends StatelessWidget {
  const CustomContainerWidget({
    required this.title,
    required this.subTitle,
    required this.leading,
    required this.trialing,
    super.key,
    this.isShowDecoration = true,
  });

  final String title;
  final String subTitle;
  final Widget leading;
  final Widget trialing;
  final bool? isShowDecoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      decoration: isShowDecoration!
          ? CustomConstantWidget.shadowBoxDecorationWidget()
          : BoxDecoration(),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 12,
          ),
          child: Row(
            children: [
              leading,
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      subTitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ),
              trialing,
            ],
          ),
        ),
      ),
    );
  }
}
