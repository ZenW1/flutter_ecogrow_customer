import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    required this.title,
    required this.onTap,
    required this.icon,
    this.mainTitle = '',
    super.key,
  });

  final String? mainTitle;
  final String title;
  final VoidCallback onTap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  width: 25,
                  height: 25,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.blackColor,
                      ),
                ),
                const Spacer(),
                const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: AppColors.greyColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
