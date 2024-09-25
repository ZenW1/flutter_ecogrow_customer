import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

class AppTitleWidget extends StatelessWidget {
  const AppTitleWidget({
    required this.text,
    super.key,
    this.fontColor,
    this.fontWeight,
    this.isRow = false,
    this.widget,
  });

  final String text;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final bool? isRow;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: fontColor ?? AppColors.blackColor,
                fontWeight: fontWeight ?? FontWeight.w600,
              ),
        ),
        if (isRow == true) widget ?? Container() else Container(),
      ],
    );
  }
}
