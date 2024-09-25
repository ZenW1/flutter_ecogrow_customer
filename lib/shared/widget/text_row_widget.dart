import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

class TextRowWidget extends StatelessWidget {
  const TextRowWidget(
      {required this.title,
      required this.subTitle,
      super.key,
      this.titleStyle,
      this.subTitleStyle});

  final String title;
  final String subTitle;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: titleStyle ??
              Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.greyColor,
                  ),
        ),
        Text(
          subTitle,
          style: subTitleStyle ?? Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
