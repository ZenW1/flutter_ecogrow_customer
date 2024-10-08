import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        children: [
          Text(
            'search',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            margin: const EdgeInsets.only(
              top: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey[200]!,
                width: 0.5,
              ),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                border: InputBorder.none,
              ),
              controller: TextEditingController(),
              textInputAction: TextInputAction.search,
              onSubmitted: (_) {},
            ),
          ),
          // if (viewModel.searchHistory!.length > 0)
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 24,
              ),
              Text(
                'Search',
              ),
              Container(
                height: 1,
                color: AppColors.lightGreyColor,
                margin: const EdgeInsets.symmetric(vertical: 8),
              ),
              // ...viewModel.searchHistory!.map(
              //       (keyword) {
              //     return TextButton(
              //       onPressed: () {
              //         FocusScope.of(context).requestFocus(FocusNode());
              //         viewModel.onSearchHistoryPressed(keyword);
              //       },
              //       child: Row(
              //         children: [
              //           Text(keyword),
              //         ],
              //       ),
              //       style: TextButton.styleFrom(
              //         primary: primaryColor,
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
