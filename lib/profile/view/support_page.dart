import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_bar_widget.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  static const String routePath = '/support';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Support',
      ),
      body: Column(
        children: [],
      ),
    );
  }

  Widget htmlData() {
    return Text.rich(
      TextSpan(
        text: 'Privacy',
        children: <TextSpan>[
          TextSpan(
            text: 'Privacy ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                'Ask CDCR San Quintin State Prison 2008. We installed Purex dispensers throughout the prison to combat diseases…and it was a Roaring Success (as in Roaring Drunk) I mean we had Long lines of prisoners fist fighting to use them.',
          ),
        ],
      ),
    );
  }
}
