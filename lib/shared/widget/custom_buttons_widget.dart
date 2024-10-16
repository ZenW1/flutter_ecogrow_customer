import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/route/app_router.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:go_router/go_router.dart';

extension AppButton on BuildContext {
  BuildContext get context => this;

  static Widget roundedFilledButton(
    BuildContext context, {
    required VoidCallback onTap,
    required String text,
    double? width,
    double? height,
    Gradient? gradient,
    Color? backgroundColor,
    Color? color,
    Color? textColor,
  }) {
    return Container(
      width: width,
      height: height ?? 55,
      decoration: BoxDecoration(
        gradient: gradient,
        color: backgroundColor ?? AppColors.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
        ),
      ),
    );
  }

  static Widget roundedSidedButton(
    BuildContext context, {
    required VoidCallback onTap,
    required String text,
    double? width,
    double? height,
    double? radius,
    Color? color,
    Color? textColor,
  }) {
    return Container(
      width: width,
      height: height ?? 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: color ?? Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(radius ?? 25),
          ),
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: textColor ?? AppColors.yellowColor,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
        ),
      ),
    );
  }

  static Widget backButton(BuildContext context, {Color? color}) {
    return GestureDetector(
      onTap: () {
         context.pop();
       },
      child: Container(
        width: 30,
        height: 30,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: color ?? AppColors.greyColor,
            width: 0.2,
          ),
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: color ?? AppColors.primary,
          ),
        ),
      ),
    );
  }

  static Widget circleButton(
    BuildContext context, {
    required VoidCallback onTap,
    required IconData icon,
    Color? color,
    Color? backgroundColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: backgroundColor ?? AppColors.whiteColor,
        child: Icon(
          icon,
          color: color ?? AppColors.primary,
        ),
      ),
    );
  }
}
