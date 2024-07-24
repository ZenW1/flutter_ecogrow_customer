import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_bar_widget.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBarWidget(
        title: 'About Us',
      ),
    );
  }
}
