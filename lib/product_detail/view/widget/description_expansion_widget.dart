import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

class DescriptionExpansionWidget extends StatelessWidget {
  const DescriptionExpansionWidget(
      {super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      textColor: AppColors.blackColor,
      collapsedTextColor: AppColors.blackColor,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.greyColor,
                ),
          ),
        ),
      ],
    );
  }
}
