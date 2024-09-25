import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';

class ProductSelectionDetailWidget extends StatelessWidget {
  const ProductSelectionDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.whiteColor,
      child: Column(
        children: [
          const AppTitleWidget(text: 'Select Options'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('KG : '),
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return FilterChip(
                        backgroundColor: AppColors.whiteColor,
                        surfaceTintColor: Colors.transparent,
                        selectedShadowColor: Colors.transparent,
                        selectedColor: AppColors.primary,
                        checkmarkColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        label: Text(
                          '10 KG',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.primary,
                                  ),
                        ),
                        onSelected: (value) {},
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: 3,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('UNIT  : '),
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Card(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        color: AppColors.lightGreyColor,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.minus,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        '1',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(width: 16),
                      Card(
                        elevation: 0,
                        color: AppColors.lightGreyColor,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.add,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
