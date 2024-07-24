import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

class TextRowWidget extends StatelessWidget {
  const TextRowWidget({required this.title, required this.subTitle, super.key});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
      title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.greyColor,
          ),
        ),
        Text(
           subTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
