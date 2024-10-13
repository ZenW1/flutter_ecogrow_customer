import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({super.key,this.title = 'No data available'});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/svg/no-data.json',
          height: MediaQuery.sizeOf(context).height * 0.3,
        ),
        Text(title!, style: Theme.of(context).textTheme.titleLarge),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.15,
        ),
      ],
    );
  }
}
