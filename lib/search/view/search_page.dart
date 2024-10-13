import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/product/bloc/product_bloc.dart';
import 'package:flutter_ecogrow_customer/product_detail/view/product_detail_page.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/global_text_field.dart';

import '../search.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(context.read<ProductBloc>()),
      child: const SearchView(),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
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
              GlobalTextField(
                textInputType: TextInputType.text,
                controller: context.read<SearchCubit>().searchController,
                hintText: 'Search...',
                autoFocus: true,
                onSubmitted: (value) {
                  context.read<SearchCubit>().searchProduct(value);
                },
                onChanged: (value) {
                  context.read<SearchCubit>().searchProduct(value);
                },
              ),
              if (state is SearchLoaded)
                if (state.data.length > 0)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        'Search result',
                      ),
                      Container(
                        height: 1,
                        color: AppColors.lightGreyColor,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      ...state.data.map(
                        (keyword) {
                          return InkWell(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());

                            },
                            child: TextButton(
                              onPressed: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                // viewModel.onSearchHistoryPressed(keyword);
                                Navigator.of(context).push(
                                  MaterialPageRoute<ProductDetailPage>(
                                    builder: (context) => ProductDetailPage(
                                      id: keyword.id.toString(),
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Text(keyword.productName!),
                                ],
                              ),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                backgroundColor: AppColors.whiteColor,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  )
            ],
          ),
        );
      },
    );
  }
}
