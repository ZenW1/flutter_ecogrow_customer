import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

class TestAnimation extends StatefulWidget {
  const TestAnimation({super.key, required this.firstChild, required this.secondChild});

  final Widget firstChild;
  final Widget secondChild;

  @override
  State<TestAnimation> createState() => _TestAnimationState();
}

class _TestAnimationState extends State<TestAnimation> with SingleTickerProviderStateMixin {

  late final _menuAC = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  late final isFilterOpen = ValueNotifier(false)..addListener(_handleFilterOpenChanged);

  late final filterColor = ColorTween(begin: AppColors.primary, end: AppColors.secondaryColor).animate(_menuAC);
  late final filterBorderRadius = Tween<double>(begin: 12, end: 0).animate(_menuAC);

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
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, cons) => Stack(
          children: [
            // Positioned(
            //   top: 0,
            //   left: 0,
            //   right: 0,
            //   bottom: 0,
            //   child: Center(
            //     child: Text('Hello World'),
            //   ),
            // ),
            AnimatedBuilder(
              animation: _menuAC,
              builder: (context, child) {
                return Container(
                  width: Tween(begin: 200.0, end: cons.maxWidth).evaluate(_menuAC),
                  height: Tween(begin: 200.0, end: cons.maxHeight).evaluate(_menuAC),
                  decoration: BoxDecoration(
                    color: filterColor.value,
                  ),
                  child: child,
                );
              },
              child: Material(
                elevation: 24,
                color: Colors.transparent,
                child: Container(
                  width: cons.maxWidth,
                  height: cons.maxHeight,
                  color: Colors.white,
                  child: InkWell(
                    onTap: (){
                      isFilterOpen.value = !isFilterOpen.value;
                      setState(() {});
                    },
                    child: isFilterOpen.value ? widget.firstChild : widget.secondChild,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
