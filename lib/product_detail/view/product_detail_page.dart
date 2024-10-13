import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/cart/bloc/cart_bloc.dart';
import 'package:flutter_ecogrow_customer/data/model/cart_list_response_model.dart';
import 'package:flutter_ecogrow_customer/data/repo/product_repo.dart';
import 'package:flutter_ecogrow_customer/data/service/cart_service.dart';
import 'package:flutter_ecogrow_customer/main/main.dart';
import 'package:flutter_ecogrow_customer/product_detail/cubit/product_detail_cubit.dart';
import 'package:flutter_ecogrow_customer/product_detail/cubit/product_selection/product_selection_cubit.dart';

import 'package:flutter_ecogrow_customer/product_detail/view/widget/description_expansion_widget.dart';
import 'package:flutter_ecogrow_customer/product_detail/view/widget/image_carousel_slider.dart';
import 'package:flutter_ecogrow_customer/product_detail/view/widget/product_price_detail_widget.dart';
import 'package:flutter_ecogrow_customer/product_detail/view/widget/product_selection_detail_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_dialog.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/dialog.dart';
import 'package:go_router/go_router.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.id});

  final String id;

  static const String routePath = '/product_detail';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDetailCubit(context.read<ProductRepo>())..getProductDetailById(id: id),
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
            context.read<ProductSelectionCubit>().resetQuantity();

            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     content: Text('Added to cart'),
            //   ),
            // );
          }
        },
        child: ProductDetailView(),
      ),
    );
  }
}

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  void initState() {
    // context.read<ProductSelectionCubit>().isSelectedOption! = true;
    super.initState();
  }

  int priceAfterDiscount({int price = 0, int discount = 1}) {
    return  price - (price * discount ~/ 100);
  }

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
                      imageList: state.data.productImage!.map((e) => e.image!).toList(),
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
                    priceAfterDiscount: priceAfterDiscount(
                      price: state.priceAfterSelection,
                      discount: state.data.discount!,
                    ).toString(),
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
                                color: Colors.grey[100],
                                child: IconButton(
                                  onPressed: () {
                                    context.read<ProductSelectionCubit>().decrementQuantity();
                                  },
                                  icon: Icon(
                                    CupertinoIcons.minus,
                                    color: state.priceAfterSelection >= 1 ?
                                     AppColors.greyColor : AppColors.primary,
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
                                color: Colors.grey[100],
                                child: IconButton(
                                  onPressed: () {
                                    context.read<ProductSelectionCubit>().incrementQuantity();
                                  },
                                  icon: Icon(
                                    CupertinoIcons.add,
                                    color: AppColors.primary,
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
                        // > discout
                        if (context.read<ProductSelectionCubit>().quantity >  state.data.baseQty!) {
                          CustomDialog.showWarningDialog('You can not add more than ${state.data.baseQty} quantity', );
                        } else {

                          final res = CartRepository.getCartData();

                          if(res!.items!.isNotEmpty){
                            AppDialog.questionDialog(
                                context,
                                title: 'Adding this item will clear your cart',
                                content: 'You already have items from another restaurant or shop in your cart', onYes: () {
                              CartRepository.clearCart();
                              context.read<CartBloc>()..add(
                                CartAddEvent(
                                  cartModel: CartModel(
                                    storeId: state.data.sellerId.toString(),
                                    storeName: state.data.sellerName.toString(),
                                    storeAddress: 'pp',
                                    storeImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzUagFSwrqo2Gh-eVcLYucZaPbx-2EG2nMA&s',
                                    products: [
                                      CartProductModel(
                                        productId: state.data.id.toString(),
                                        productName: state.data.productName,
                                        unitType: context.read<ProductSelectionCubit>().unitTypeOption,
                                        price: context.read<ProductSelectionCubit>().priceAfterSelection.toDouble(),
                                        stockQuantity: state.data.baseQty,
                                        productImage: state.data.productImage!.first.image,
                                        description: 'kk',
                                        discount: state.data.discount.toString(),
                                        unitTypeId: context.read<ProductSelectionCubit>().id,
                                        expiredOn: DateTime.tryParse(state.data.expiredOn!.toString()),
                                        quantity: context.read<ProductSelectionCubit>().quantity.toString(),
                                        categories: [
                                          state.data.categoryName!,
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                          } else {
                            context.read<CartBloc>()..add(
                              CartAddEvent(
                                cartModel: CartModel(
                                  storeId: state.data.sellerId.toString(),
                                  storeName: state.data.sellerName.toString(),
                                  storeAddress: 'pp',
                                  storeImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzUagFSwrqo2Gh-eVcLYucZaPbx-2EG2nMA&s',
                                  products: [
                                    CartProductModel(
                                      productId: state.data.id.toString(),
                                      productName: state.data.productName,
                                      unitType: context.read<ProductSelectionCubit>().unitTypeOption,
                                      price: context.read<ProductSelectionCubit>().priceAfterSelection.toDouble(),
                                      stockQuantity: state.data.baseQty,
                                      productImage: state.data.productImage!.first.image,
                                      description: 'kk',
                                      discount: state.data.discount.toString(),
                                      unitTypeId: context.read<ProductSelectionCubit>().id,
                                      expiredOn: DateTime.tryParse(state.data.expiredOn!.toString()),
                                      quantity: context.read<ProductSelectionCubit>().quantity.toString(),
                                      categories: [
                                        state.data.categoryName!,
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                        }
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
