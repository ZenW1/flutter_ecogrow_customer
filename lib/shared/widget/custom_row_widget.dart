import 'package:flutter/material.dart';

class CustomRowWidget extends StatelessWidget {
  const CustomRowWidget({super.key, this.leftWidget, this.rightWidget});

  final Widget? leftWidget;
  final Widget? rightWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leftWidget!,
        rightWidget!,
      ],
    );
  }
}
