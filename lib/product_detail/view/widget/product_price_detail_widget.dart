import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

class ProductPriceDetailWidget extends StatelessWidget {
  const ProductPriceDetailWidget({
    super.key,
    required this.title,
    required this.category,
    required this.condition,
    required this.price,
    required this.discount,
    required this.priceAfterDiscount,
  });

  final String title;
  final String category;
  final String condition;
  final String price;
  final String discount;
  final String priceAfterDiscount;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Text(
            category,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text.rich(
                TextSpan(
                  text: 'Condition : ',
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: condition,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Icon(
                Icons.favorite,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                '៛${priceAfterDiscount}',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.redColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
              ),
              const SizedBox(width: 16),
              Text(
                '៛${price}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.grey.shade600,
                      decorationThickness: 2,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.redColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${discount}% OFF',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
