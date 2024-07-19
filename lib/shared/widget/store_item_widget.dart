import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/data/model/store_model.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_cache_image_widget.dart';

class StoreItemWidget extends StatelessWidget {
  const StoreItemWidget({required this.data, super.key, this.trailingWidget});

  final StoreModel data;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomCacheImageWidget(
            imageUrl: data.storeImage,
            width: 60,
            height: 60,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.storeName,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${data.storeCategory} | ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: '${data.totalOrder} Orders',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          trailingWidget!,
        ],
      ),
    );
  }
}
