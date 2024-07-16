import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ecogrow_customer/product/product.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';

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
                leading: AppButton.backButton(context,color: Colors.white) ,
                floating: true,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart,color: Colors.white,),
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                  ),
                ],
                expandedHeight: 300,
                forceMaterialTransparency: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    'https://www.eatright.org/-/media/images/eatright-articles/eatright-article-feature-images/gotropicalwithsuperfruits_600x450.jpg?as=0&w=967&rev=917893f7577c41a09ef7a258a2c7a855&hash=BBEF28BFC10511A514528D287E34F3AB',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
