import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppColors.primary,
              fontSize: 18,
            ),
      ),
      leading: AppButton.backButton(context),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
