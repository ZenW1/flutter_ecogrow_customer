import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/cart/bloc/cart_bloc.dart';
import 'package:flutter_ecogrow_customer/data/model/cart_list_response_model.dart';
import 'package:flutter_ecogrow_customer/data/repo/product_repo.dart';
import 'package:flutter_ecogrow_customer/main/main.dart';
import 'package:flutter_ecogrow_customer/product_detail/cubit/product_detail_cubit.dart';
import 'package:flutter_ecogrow_customer/product_detail/cubit/product_selection/product_selection_cubit.dart';

import 'package:flutter_ecogrow_customer/product_detail/view/widget/description_expansion_widget.dart';
import 'package:flutter_ecogrow_customer/product_detail/view/widget/image_carousel_slider.dart';
import 'package:flutter_ecogrow_customer/product_detail/view/widget/product_price_detail_widget.dart';
import 'package:flutter_ecogrow_customer/product_detail/view/widget/product_selection_detail_widget.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:go_router/go_router.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  static const String routePath = '/product_detail';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDetailCubit(
        context.read<ProductRepo>(),)..getProductDetail(),
      child: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartAddEvent) {
            context.read<CartBloc>()..add(CartFetchEvent());
          } else if (state is CartFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to add to cart'),
              ),
            );
          } else if (state is CartSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Added to cart'),
              ),
            );
          }
        },
        child: ProductDetailView(),
      ),
    );
  }
}

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailCubit, ProductDetailState>(
      buildWhen: (previous, current) {
        if (previous is ProductDetailLoaded && current is ProductDetailLoaded) {
          return previous.priceAfterSelection != current.priceAfterSelection;
        }
        return true;
      },
      builder: (context, state) {
        if (state is ProductDetailLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductDetailLoaded) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  leadingWidth: 56,
                  floating: true,
                  leading: Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: AppButton.circleButton(
                      context,
                      onTap: () {
                        if (GoRouter.of(context).canPop()) {
                          GoRouter.of(context).pop();
                        } else {
                          context.pushReplacement(MainPage.routePath);
                        }
                      },
                      icon: Icons.arrow_back_ios_new_rounded,
                    ),
                  ),
                  actions: [
                    AppButton.circleButton(
                      context,
                      onTap: () {},
                      icon: Icons.shopping_cart,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                  expandedHeight: 250,
                  collapsedHeight: 100,
                  flexibleSpace: FlexibleSpaceBar(
                    background: ImageCarouselSlider(
                      imageList: state.data.productImage!
                          .map((e) => e.image!)
                          .toList(),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ProductPriceDetailWidget(
                    title: state.data.productName!,
                    category: state.data.categoryName!,
                    condition: 'New',
                    stockQuantity: state.data.baseQty.toString(),
                    price: state.priceAfterSelection.toString(),
                    discount: state.data.discount.toString(),
                    priceAfterDiscount: state.priceAfterSelection.toString(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: const SizedBox(
                    height: 8,
                  ),
                ),
                SliverToBoxAdapter(
                  child: ProductSelectionDetailWidget(
                    productVariation: state.data,
                  ),
                ),
                SliverToBoxAdapter(
                  child: const SizedBox(
                    height: 8,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: AppColors.backgroundColor,
                    ),
                    child: Container(
                      color: AppColors.whiteColor,
                      child: Column(
                        children: [
                          DescriptionExpansionWidget(
                            title: 'Description ',
                            description:
                                'Welcome to dinoclaire.my shop!We provide the best service and the best beauty products.Wholesale please.Wholesale please. ',
                          ),
                          DescriptionExpansionWidget(
                            title: 'Shipping & Returns',
                            description:
                                'Welcome to dinoclaire.my shop!We provide the best service and the best beauty products.Wholesale please.Wholesale please. ',
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: const SizedBox(
                    height: 8,
                  ),
                ),
                // SliverToBoxAdapter(
                //   child: SizedBox(
                //     height: 50,
                //     width: double.infinity,
                //     child: ListTile(
                //       tileColor: AppColors.whiteColor,
                //       leading: CustomCacheImageWidget(
                //         imageUrl:
                //             'https://as1.ftcdn.net/v2/jpg/01/65/88/42/1000_F_165884283_tkufVlDgGu6CTj8mzWsEe3AS9Elw03ek.jpg',
                //       ),
                //       title: Text(
                //         'David Store',
                //         style: Theme.of(context).textTheme.titleLarge,
                //       ),
                //       subtitle: Text(
                //         'ហាងលក់ទំនើប',
                //         style: Theme.of(context).textTheme.bodySmall,
                //       ),
                //     ),
                //   ),
                // ),
                // const SliverToBoxAdapter(
                //   child: SizedBox(
                //     height: 50,
                //   ),
                // ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackColor.withOpacity(0.05),
                    blurRadius: 1,
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  BlocBuilder<ProductSelectionCubit, ProductSelectionState>(
                    builder: (context, state) {
                      return Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Card(
                                elevation: 0,
                                shape: CircleBorder(),
                                shadowColor: Colors.transparent,
                                color: AppColors.lightGreyColor,
                                child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<ProductSelectionCubit>()
                                        .decrementQuantity();
                                  },
                                  icon: Icon(
                                    CupertinoIcons.minus,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                state.quantity.toString(),
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(width: 16),
                              Card(
                                elevation: 0,
                                shape: CircleBorder(),
                                color: AppColors.lightGreyColor,
                                child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<ProductSelectionCubit>()
                                        .incrementQuantity();
                                  },
                                  icon: Icon(
                                    CupertinoIcons.add,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Expanded(
                    flex: 2,
                    child: AppButton.roundedFilledButton(
                      context,
                      onTap: () {
                        context.read<CartBloc>()
                          ..add(
                            CartAddEvent(
                              cartModel: CartModel(
                                storeId: '3',
                                storeName: 'david',
                                storeAddress: 'pp',
                                storeImage:
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzUagFSwrqo2Gh-eVcLYucZaPbx-2EG2nMA&s',
                                products: [
                                  CartProductModel(
                                      productId: state.data.id.toString(),
                                      productName: state.data.productName,
                                      unitType: 'kg',
                                      price:
                                          state.priceAfterSelection.toDouble(),
                                      stockQuantity: state.data.baseQty,
                                      productImage:
                                          state.data.productImage!.first.image,
                                      description: 'kk',
                                      discount: state.data.discount.toString(),
                                      quantity: state.quantity.toString(),
                                      categories: [
                                        state.data.categoryName!,
                                      ]),
                                ],
                              ),
                            ),
                          );
                      },
                      text: 'Add To Cart',
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is ProductFailure) {
          return const Center(
            child: Text('Error'),
          );
        }
        return const Center(
          child: Text('Error'),
        );
      },
    );
  }
}
