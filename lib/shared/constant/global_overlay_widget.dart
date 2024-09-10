import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_indicator/loading_indicator.dart';

class GlobalOverLayWidget extends StatelessWidget {
  const GlobalOverLayWidget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayColor: Colors.black.withOpacity(0.5),
      overlayWidgetBuilder: (overlayWidget) => Center(
        child: Container(
          padding: EdgeInsets.all(10),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: AppColors.whiteColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: SizedBox(
            width: 50,
            height: 50,
            child: LoadingIndicator(
              indicatorType: Indicator.ballPulseSync,
              colors: [AppColors.primary],
            ),
          ),
        ),
      ),
      child: child,
    );
  }
}
