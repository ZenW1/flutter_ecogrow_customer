import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

extension CustomConstantWidget on Widget {
  static BoxDecoration shadowBoxDecorationWidget(
      {double? radius, Color? color}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 10),
      color: color ?? AppColors.backgroundColor,
      boxShadow: [
        BoxShadow(
          color: AppColors.shadowColor,
          spreadRadius: 0,
          blurRadius: 2,
          offset: const Offset(1, 1),
        ),
      ],
    );
  }
}

extension AutoFocusNode on FocusNode {
  static void requestFocusNode(BuildContext context, FocusNode focusNode) {
    return FocusScope.of(context).requestFocus(focusNode);
  }

  static void unFocusNode(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
