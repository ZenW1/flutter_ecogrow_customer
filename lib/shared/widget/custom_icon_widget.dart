import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

class CustomCircleIcon extends StatelessWidget {
  const CustomCircleIcon(
      {super.key,
      required this.radius,
      required this.onTap,
      required this.icon});

  final double? radius;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.primary,
      radius: radius ?? 15,
      child: IconButton(
        onPressed: onTap,
        icon: Center(
          child: Icon(
            icon,
            color: AppColors.whiteColor,
            size: radius ?? 15,
          ),
        ),
      ),
    );
  }
}
