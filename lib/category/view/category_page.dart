import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/cart/bloc/cart_bloc.dart';

import 'package:flutter_ecogrow_customer/category/category.dart';
import 'package:flutter_ecogrow_customer/category/view/category_item_widget.dart';
import 'package:flutter_ecogrow_customer/data/repo/product_repo.dart';
import 'package:flutter_ecogrow_customer/product/view/product_view_all_vertical_page.dart';
import 'package:flutter_ecogrow_customer/search/search.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/emtpy_data_widget.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  static const String routePath = '/category';

  @override
  Widget build(BuildContext context) {
    return CategoryView();
  }
}

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  void initState() {
    context.read<ProductRepo>().getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Category'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage()));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primary,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  color: AppColors.whiteColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: Text(
                        'Search by Keywords',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Icon(CupertinoIcons.search),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
              if (state is CategoryLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CategoryLoaded) {
                return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: state.categoryResponseModel.data!.length,
                  itemBuilder: (context, index) {
                    return CategoryItemWidget(
                      categoryItemModel: state.categoryResponseModel.data![index],
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ProductViewAllVerticalPage(
                                    id: state.categoryResponseModel.data![index].id!,
                                  )),
                        );
                      },
                    );
                  },
                );
              } else if (state is CategoryFailed) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
