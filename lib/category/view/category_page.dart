import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ecogrow_customer/category/category.dart';
import 'package:flutter_ecogrow_customer/category/view/category_item_widget.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  static const String routePath = '/category';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryCubit(),
      child: const CategoryView(),
    );
  }
}

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Category'),
          ),
          body: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount:
                        context.read<CategoryCubit>().categoryList.length,
                    itemBuilder: (context, index) {
                      return CategoryItemWidget(
                        categoryItemModel:
                            context.read<CategoryCubit>().categoryList[index],
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
