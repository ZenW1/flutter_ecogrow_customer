import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/checkout/view/view.dart';
import 'package:flutter_ecogrow_customer/main/main.dart';

import 'package:flutter_ecogrow_customer/product/product.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:go_router/go_router.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  static const String routePath = '/product';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit(),
      child: const ProductView(),
    );
  }
}

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
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
                leadingWidth: 56,
                floating: true,
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
                  background: Image.network(
                    'https://www.eatright.org/-/media/images/eatright-articles/eatright-article-feature-images/gotropicalwithsuperfruits_600x450.jpg?as=0&w=967&rev=917893f7577c41a09ef7a258a2c7a855&hash=BBEF28BFC10511A514528D287E34F3AB',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Coconuts',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Fruit',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'Condition : ',
                              style: Theme.of(context).textTheme.bodyMedium,
                              children: [
                                TextSpan(
                                  text: 'Fresh',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.favorite,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text(
                            '៛៩៥០០',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: AppColors.redColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            '៛១០០០០',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.grey.shade600,
                                  decorationThickness: 2,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.redColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '5% OFF',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const AppTitleWidget(text: 'Select Options'),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('KG : '),
                          const SizedBox(width: 16),
                          Expanded(
                            child: SizedBox(
                              height: 60,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return FilterChip(
                                    backgroundColor: AppColors.whiteColor,
                                    surfaceTintColor: Colors.transparent,
                                    selectedShadowColor: Colors.transparent,
                                    selectedColor: AppColors.primary,
                                    checkmarkColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    label: Text(
                                      '10 KG',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.primary,
                                          ),
                                    ),
                                    onSelected: (value) {},
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    width: 10,
                                  );
                                },
                                itemCount: 3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent,
                  ),
                  child: Column(
                    children: [
                      ExpansionTile(
                        title: const Text('Description'),
                        textColor: AppColors.blackColor,
                        collapsedTextColor: AppColors.blackColor,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Welcome to dinoclaire.my shop!We provide the best service and the best beauty products.Wholesale please.Wholesale please. ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: AppColors.greyColor,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        title: const Text('Specification'),
                        textColor: AppColors.blackColor,
                        collapsedTextColor: AppColors.blackColor,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Welcome to dinoclaire.my shop!We provide the best service and the best beauty products.Wholesale please.Wholesale please. ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: AppColors.greyColor,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 50,
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 32,
              top: 16,
            ),
            child: Row(
              children: [
                Expanded(
                  child: AppButton.roundedFilledButton(
                    context,
                    onTap: () {
                    },
                    text: 'Add to Cart',
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: AppButton.roundedFilledButton(
                    context,
                    onTap: () {
                      context.push(CheckoutPage.routePath);
                    },
                    text: 'Buy Now',
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
