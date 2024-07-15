import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ecogrow_customer/cart/cart.dart';
import 'package:flutter_ecogrow_customer/cart/view/widget/cart_item_widget.dart';
import 'package:flutter_ecogrow_customer/data/model/cart_model.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_row_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static const String routePath = '/cart';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit(),
      child: const CartView(),
    );
  }
}

class CartView extends StatelessWidget {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cartModel = <CartModel>[
          const CartModel(
            id: '1',
            storeName: 'Ecogrow Store',
            products: [
              CartProductModel(
                id: '1',
                productName: 'Product 1',
                productImage:
                    'https://hillfresh.eu/wp-content/uploads/2021/12/aardbei-621x420.jpg',
                productPrice: '100',
                productQuantity: '1',
              ),
              CartProductModel(
                id: '2',
                productName: 'Product 2',
                productImage: 'https://via.placeholder.com/150',
                productPrice: '200',
                productQuantity: '2',
              ),
            ],
          ),
          const CartModel(
            id: '1',
            storeName: 'Ecogrow Store',
            products: [
              CartProductModel(
                id: '1',
                productName: 'Product 1',
                productImage:
                    'https://hillfresh.eu/wp-content/uploads/2021/12/aardbei-621x420.jpg',
                productPrice: '100',
                productQuantity: '1',
              ),
              CartProductModel(
                id: '2',
                productName: 'Product 2',
                productImage: 'https://via.placeholder.com/150',
                productPrice: '200',
                productQuantity: '2',
              ),
            ],
          ),
        ];
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Cart'),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeExtraSmall(),
              ),
              child: Column(
                children: [
                  CustomRowWidget(
                    leftWidget: Text(
                      'Ecogrow Store',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    rightWidget: const Text('3 items'),
                  ),
                  SizedBox(height: Dimensions.paddingSizeSmall()),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cartModel.length,
                    itemBuilder: (context, index) {
                      return CartItemWidget(
                        data: cartModel[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: Dimensions.paddingSizeSmall());
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
