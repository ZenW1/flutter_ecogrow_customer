import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

extension CustomConstantWidget on Widget {
  static BoxDecoration shadowBoxDecorationWidget({double? radius}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 10),
      color: AppColors.whiteColor,
      boxShadow:  [
        BoxShadow(
          color: AppColors.shadowColor,
          spreadRadius: -4.88,
          blurRadius: 15,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }
}
