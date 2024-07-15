import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';

class CustomCacheImageWidget extends StatelessWidget {
  const CustomCacheImageWidget({
    required this.imageUrl,
    super.key,
    this.onTap,
    this.width,
    this.height,
  });

  final String imageUrl;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: AnimatedOpacity(
          opacity: 0.4,
          duration: const Duration(milliseconds: 300),
          child: Container(),
        ),
      ),
      imageBuilder: (context, imageProvider) => InkWell(
        onTap: onTap ??
            () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => PhotoViewWidget(
              //       image: imageUrl,
              //     ),
              //   ),
              // );
            },
        child: Container(
          width: width ?? 55,
          height: height ?? 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Dimensions.paddingSizeSmall(),
            ),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      // default image
      // errorWidget: (context, url, error) => SvgPicture.asset(
      //   'assets/svg/placeholder.svg',
      //   width: 65,
      //   height: 65,
      // ),
    );
  }
}
