import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCacheImageWidget extends StatelessWidget {
  const CustomCacheImageWidget({
    required this.imageUrl,
    super.key,
    this.onTap,
    this.width,
    this.height,
    this.radius,
  });

  final String? imageUrl;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: AnimatedOpacity(
          opacity: 0.4,
          duration: const Duration(milliseconds: 300),
          child: Container(),
        ),
      ),
      // placeholder: (context, url) => Center(
      //   child: SvgPicture.asset(
      //     'assets/svg/placeholder.svg',
      //     width: width ?? 100,
      //     height: height ?? 100,
      //     fit: BoxFit.cover,
      //   ),
      // ),
      errorWidget: (context, url, error) {
        return Center(
          child: SvgPicture.asset(
            'assets/svg/placeholder.svg',
            width: width ?? 100,
            height: height ?? 100,
            fit: BoxFit.cover,
          ),
        );
      },

      imageBuilder: (context, imageProvider) => Container(
        child: imageProvider != 'null' ?
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: width ?? 100,
            height: height ?? 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ) : Container(),
      ),
    );
  }
}
