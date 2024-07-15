import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

extension CustomConstantWidget on Widget {
  static BoxDecoration shadowWidget() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: AppColors.shadowColor,
          spreadRadius: -4.88,
          blurRadius: 15,
          offset: Offset(0, 3),
        ),
      ],
    );
  }
}
