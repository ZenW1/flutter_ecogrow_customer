import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_carousel_slider_widget.dart';

class ImageCarouselSlider extends StatelessWidget {
  const ImageCarouselSlider({super.key, required this.imageList});

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return CustomCarouselSliderWidget(
      slides: imageList,
    );
  }
}
