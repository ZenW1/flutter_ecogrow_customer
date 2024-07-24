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
  });

  final String title;
  final String subTitle;
  final Widget leading;
  final Widget trialing;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      decoration: CustomConstantWidget.shadowBoxDecorationWidget(),
      child: ListTile(
        leading: leading,
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.blackColor,
              ),
        ),
        subtitle: Text(
          subTitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.greyColor,
              ),
        ),
        trailing: trialing,
      ),
    );
  }
}
