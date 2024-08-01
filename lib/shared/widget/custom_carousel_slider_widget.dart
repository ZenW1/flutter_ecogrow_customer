import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomCarouselSliderWidget extends StatefulWidget {
  CustomCarouselSliderWidget({
    required this.newWidget,
    super.key,
    this.slides,
    this.autoPlay = true,
    this.boxFit,
  });

  final List<String>? slides;
  final bool autoPlay;
  final Widget newWidget;
  BoxFit? boxFit;

  @override
  _CustomCarouselSliderWidgetState createState() => _CustomCarouselSliderWidgetState();
}

class _CustomCarouselSliderWidgetState extends State<CustomCarouselSliderWidget> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          child: CarouselSlider.builder(
            // carouselController: carouselController,
            itemCount: widget.slides!.length,
            itemBuilder: (context, index, __) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                height: MediaQuery.of(context).size.height * 0.19,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.slides![index],
                    ),
                    fit: widget.boxFit ?? BoxFit.cover,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.4,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 5,
          child: AnimatedSmoothIndicator(
            activeIndex: _current,
            count: widget.slides!.length,
            effect: const ExpandingDotsEffect(
              activeDotColor: AppColors.primary,
              dotColor: AppColors.primary,
              dotHeight: 8,
              dotWidth: 8,
              expansionFactor: 4,
              spacing: 5,
            ),
          ),
        ),
      ],
    );
  }
}
