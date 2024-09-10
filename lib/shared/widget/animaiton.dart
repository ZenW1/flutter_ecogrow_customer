import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

class AnimationState extends StatefulWidget {
  const AnimationState({super.key});

  @override
  State<AnimationState> createState() => _AnimationStateState();
}

class _AnimationStateState extends State<AnimationState>
    with SingleTickerProviderStateMixin {
  late final _menuAC =
      AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  late final isFilterOpen = ValueNotifier(false)
    ..addListener(_handleFilterOpenChanged);

  late final filterColor =
      ColorTween(begin: AppColors.primary, end: AppColors.primary)
          .animate(_menuAC);
  late final filterBorderRadius =
      Tween<double>(begin: 12, end: 0).animate(_menuAC);

  void _handleFilterOpenChanged() {
    print(isFilterOpen.value);
    if (isFilterOpen.value) {
      _menuAC.forward();
    } else {
      _menuAC.reverse();
    }
  }

  @override
  void dispose() {
    _menuAC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (context, cons) => Stack(
          children: [
            AnimatedBuilder(
              animation: _menuAC,
              builder: (context, child) {
                return Positioned(
                  bottom: Tween(begin: 16.0, end: 0.0).evaluate(_menuAC),
                  right: Tween(begin: 16.0, end: 0.0).evaluate(_menuAC),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(12.0),
                      topRight: const Radius.circular(12.0),
                      bottomLeft: Radius.circular(
                          Tween<double>(begin: 12, end: 0).evaluate(_menuAC)),
                      bottomRight: Radius.circular(
                          Tween<double>(begin: 12, end: 0).evaluate(_menuAC)),
                    ),
                    child: Container(
                      width: Tween(begin: 56.0, end: cons.maxWidth)
                          .evaluate(_menuAC),
                      height: Tween(
                              begin: 56.0,
                              end: min(cons.maxHeight * 0.7, 500.0))
                          .evaluate(_menuAC),
                      decoration: BoxDecoration(
                        color: filterColor.value,
                      ),
                      child: child,
                    ),
                  ),
                );
              },
              child: Material(
                elevation: 24,
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    isFilterOpen.value = !isFilterOpen.value;
                  },
                  child:
                      const Center(child: Icon(Icons.add, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
