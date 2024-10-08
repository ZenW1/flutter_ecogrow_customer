import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_bar_widget.dart';

class TermConditionPage extends StatelessWidget {
  const TermConditionPage({super.key});

  static const String routePath = '/term-condition';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Term & Condition',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              htmlData(),
            ],
          ),
        ),
      ),
    );
  }

  Widget htmlData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TERMS',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Ask CDCR San Quintin State Prison 2008. We installed Purex dispensers throughout the prison to combat diseases…and it was a Roaring Success (as in Roaring Drunk) I mean we had Long lines of prisoners fist fighting to use them.',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Cut from geometric cotton lace mimicking decorative fretwork, this blouse reveals hints of skin offsetting its long-sleeve silhouette',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'CONDITIONS',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Ask CDCR San Quintin State Prison 2008. We installed Purex dispensers throughout the prison to combat diseases…and it was a Roaring Success (as in Roaring Drunk) I mean we had Long lines of prisoners fist fighting to use them.',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Full | Driving house with dirty bassline, huge beats, soulful male vocal, vocal FX & heavy synths. Lee Dagger dub remix available.',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'The social media maestro, owner of Instagram, WhatsApp, and its namesake website. It has returned more than 41% from Oct 28, 2019, to Oct 28, 2020, and more than 162% since Oct 28, 2015. ',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Company Policy ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Ask CDCR San Quintin State Prison 2008. We installed Purex dispensers throughout the prison to combat diseases…and it was a Roaring Success (as in Roaring Drunk) I mean we had Long lines of prisoners fist fighting to use them.',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Full | Driving house with dirty bassline, huge beats, soulful male vocal, vocal FX & heavy synths. Lee Dagger dub remix available.',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'The social media maestro, owner of Instagram, WhatsApp, and its namesake website. It has returned more than 41% from Oct 28, 2019, to Oct 28, 2020, and more than 162% since Oct 28, 2015. ',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}
