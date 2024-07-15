import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_indicator/loading_indicator.dart';

class GlobalOverLayWidget extends StatelessWidget {
  const GlobalOverLayWidget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayColor: Colors.grey.withOpacity(0.3),
      overlayWidgetBuilder: (overlayWidget) => const Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: LoadingIndicator(
            indicatorType: Indicator.lineSpinFadeLoader,
            colors: [Colors.blue],
          ),
        ),
      ),
      child: child,
    );
  }
}
