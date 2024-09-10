import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/main/main.dart';

import 'package:flutter_ecogrow_customer/product/product.dart';
import 'package:flutter_ecogrow_customer/product/view/widget/description_expansion_widget.dart';
import 'package:flutter_ecogrow_customer/product/view/widget/image_carousel_slider.dart';
import 'package:flutter_ecogrow_customer/product/view/widget/product_price_detail_widget.dart';
import 'package:flutter_ecogrow_customer/product/view/widget/product_selection_detail_widget.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_cache_image_widget.dart';
import 'package:go_router/go_router.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  static const String routePath = '/product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.backgroundColor, body: ProductView());
  }
}

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    context.read<ProductCubit>().getProductDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
              imageList: [
                'https://www.eatright.org/-/media/images/eatright-articles/eatright-article-feature-images/gotropicalwithsuperfruits_600x450.jpg?as=0&w=967&rev=917893f7577c41a09ef7a258a2c7a855&hash=BBEF28BFC10511A514528D287E34F3AB',
                'https://www.eatright.org/-/media/images/eatright-articles/eatright-article-feature-images/gotropicalwithsuperfruits_600x450.jpg?as=0&w=967&rev=917893f7577c41a09ef7a258a2c7a855&hash=BBEF28BFC10511A514528D287E34F3AB',
                'https://www.eatright.org/-/media/images/eatright-articles/eatright-article-feature-images/gotropicalwithsuperfruits_600x450.jpg?as=0&w=967&rev=917893f7577c41a09ef7a258a2c7a855&hash=BBEF28BFC10511A514528D287E34F3AB',
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: ProductPriceDetailWidget(
            title: 'Coconut',
            category: 'Fruit',
            condition: 'New',
            price: '10000',
            discount: '10',
            priceAfterDiscount: '9000',
          ),
        ),
        SliverToBoxAdapter(
          child: const SizedBox(
            height: 8,
          ),
        ),
        SliverToBoxAdapter(
          child: ProductSelectionDetailWidget(),
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

        SliverToBoxAdapter(
          child: ListTile(
            tileColor: AppColors.whiteColor,
            leading: CustomCacheImageWidget(
              imageUrl:
              'https://as1.ftcdn.net/v2/jpg/01/65/88/42/1000_F_165884283_tkufVlDgGu6CTj8mzWsEe3AS9Elw03ek.jpg',
            ),
            title: Text('David Store',
             style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text('ហាងលក់ទំនើប',
             style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 50,
          ),
        ),
      ],
    );
  }
}
