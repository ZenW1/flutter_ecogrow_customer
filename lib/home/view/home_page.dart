import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/category/category.dart';
import 'package:flutter_ecogrow_customer/category/view/category_item_widget.dart';
import 'package:flutter_ecogrow_customer/home/home.dart';
import 'package:flutter_ecogrow_customer/product/view/widget/custom_show_product_bottom_widget.dart';
import 'package:flutter_ecogrow_customer/product/view/widget/product_vertical_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routePath = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({super.key});

  List<ProductModel> productList = [
    // imageurl fron internet
    ProductModel(
      name: 'ONION',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgIxB4TqKd66zyoFXx9QiHPP_bsfzq6xLPHA&s',
      condition: 'Fresh',
      price: '1.5',
    ),
    ProductModel(
      name: 'POTATO',
      imageUrl: 'https://m.media-amazon.com/images/I/313dtY-LOEL._AC_UF1000,1000_QL80_.jpg',
      condition: 'Fresh',
      price: '1.5',
    ),
    ProductModel(
      name: 'TOMATO',
      imageUrl:
          'https://m.economictimes.com/thumb/msid-95423731,width-1200,height-900,resizemode-4,imgsize-56196/tomatoes-canva.jpg',
      condition: 'Fresh',
      price: '1.5',
    ),
    ProductModel(
      name: 'CUCUMBER',
      imageUrl: 'https://www.fervalle.com/wp-content/uploads/2022/07/580b57fcd9996e24bc43c216-1024x869.png',
      condition: 'Fresh',
      price: '1.5',
    ),
    ProductModel(
      name: 'CARROT',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOvY2J8wtwxZDor81a79R1_9e93VaIEfNGOg&s',
      condition: 'Fresh',
      price: '1.5',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 50,
                floating: true,
                pinned: true,
                flexibleSpace: SafeArea(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeSmall(),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.filter_list,
                          color: AppColors.primary,
                          size: Dimensions.iconSizeLarge(),
                        ),
                        SizedBox(width: Dimensions.paddingSizeDefault()),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Location',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              'Phnom Penh Cambodia',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/cart');
                          },
                          child: Icon(
                            Icons.shopping_cart_rounded,
                            color: AppColors.primary,
                            size: Dimensions.iconSizeDefault(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeSmall(),
                    vertical: Dimensions.paddingSizeDefault(),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTitleWidget(
                        text: 'Categories',
                        isRow: true,
                        widget: TextButton(
                          onPressed: () {},
                          child: Text(
                            'See all',
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                      // SizedBox(height: Dimensions.paddingSizeDefault()),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 140,
                          minHeight: 100,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.paddingSizeSmall(),
                          ),
                          shrinkWrap: true,
                          itemCount: context.read<CategoryCubit>().categoryList.length,
                          itemBuilder: (context, index) {
                            return CategoryItemWidget(
                              categoryItemModel: context.read<CategoryCubit>().categoryList[index],
                              onTap: () {
                              },
                            );
                          },
                        ),
                      ),
                      // SizedBox(height: Dimensions.paddingSizeDefault()),
                      AppTitleWidget(
                        text: 'Product',
                        isRow: true,
                        widget: TextButton(
                          onPressed: () {},
                          child: Text(
                            'See all',
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                      // SizedBox(height: Dimensions.paddingSizeDefault()),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          vertical: Dimensions.paddingSizeSmall(),
                        ),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                        itemCount: productList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              CustomProductShowButtomSheet.showBottomSheet;
                            },
                            child: ProductVerticalWidget(
                              onTap: () {
                                context.go('/product');
                              },
                              product: productList[index],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ProductModel {
  ProductModel({
    required this.name,
    required this.imageUrl,
    required this.condition,
    required this.price,
  });

  final String name;
  final String imageUrl;
  final String condition;
  final String price;
}
