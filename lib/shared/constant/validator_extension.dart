import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

extension ValidatorExtension on dynamic {
  static String orderStatusValidator(OrderStatus status) {
    switch (status) {
      case OrderStatus.all:
        return 'All';
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.completed:
        return 'Completed';
      case OrderStatus.cancelled:
        return 'Cancelled';
    }
  }

  static int orderStatusIdValidator(OrderStatus status) {
    switch (status) {
      case OrderStatus.all:
        return 0;
      case OrderStatus.processing:
        return  6;
      case OrderStatus.pending:
        return  5;
      case OrderStatus.completed:
        return 1;
      case OrderStatus.cancelled:
        return 4;
    }
  }

  static Color orderStatusValidatorColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.all:
        return Colors.black;
      case OrderStatus.processing:
        return AppColors.blueColor;
      case OrderStatus.pending:
        return AppColors.yellowColor;
      case OrderStatus.completed:
        return AppColors.primary;
      case OrderStatus.cancelled:
        return AppColors.redColor;
    }
  }
}

extension SizeSpace on num {
  Size get w => Size(this.toDouble(), 0);

  Size get h => Size(0, this.toDouble());
}

extension SizedBoxSpace on num {
  SizedBox get w => SizedBox(width: this.toDouble());

  SizedBox get h => SizedBox(height: this.toDouble());
}

extension symmetricPaddingExtension on Widget {
  Widget symmetricPadding(double w, double h) => Padding(
        padding: EdgeInsets.symmetric(horizontal: w, vertical: h),
        child: this,
      );
}
