import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

class CustomCarouselSliderWidget extends StatefulWidget {
  CustomCarouselSliderWidget({
    super.key,
    this.slides,
    this.autoPlay = true,
    this.boxFit,
  });

  final List<String>? slides;
  final bool autoPlay;
  BoxFit? boxFit;

  @override
  _CustomCarouselSliderWidgetState createState() =>
      _CustomCarouselSliderWidgetState();
}

class _CustomCarouselSliderWidgetState
    extends State<CustomCarouselSliderWidget> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.35,
          child: CarouselSlider.builder(
            // carouselController: carouselController,
            itemCount: widget.slides!.length,
            itemBuilder: (context, index, __) {
              return Container(
                // margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                height: MediaQuery.of(context).size.height * 0.19,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(14),
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
              autoPlay: false,
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
          bottom: 10,
          right: 20,
          child: Container(
            width: 50,
            height: 25,
            decoration: BoxDecoration(
              color: AppColors.blackColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                '${_current} / ${widget.slides!.length}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.whiteColor, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
