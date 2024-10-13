import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/authentication/authentication_bloc.dart';
import 'package:flutter_ecogrow_customer/cart/bloc/cart_bloc.dart';

import 'package:flutter_ecogrow_customer/cart/cart.dart';
import 'package:flutter_ecogrow_customer/cart/view/widget/cart_item_widget.dart';
import 'package:flutter_ecogrow_customer/cart/view/widget/cart_product_widget.dart';
import 'package:flutter_ecogrow_customer/checkout/checkout.dart';
import 'package:flutter_ecogrow_customer/data/model/cart_list_response_model.dart';
import 'package:flutter_ecogrow_customer/login/login.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_constant_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_dialog.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_cache_image_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_icon_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/dialog.dart';
import 'package:flutter_ecogrow_customer/shared/widget/emtpy_data_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/slidable_widget.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static const String routePath = '/cart';

  @override
  Widget build(BuildContext context) {
    return CartView();
  }
}

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  bool? valueChange = false;
  bool? valueChangeByProduct = false;
  int countSelected = 0;
  int countTotalPrice = 0;
  int? totalPrice = 0;
  CartModel? cartModel = CartModel();

  void onDecrease(int index, int secondIndex, int count, CartProductModel product, CartModel list) {
    product.quantity = count.toString();
    if (product.selected!) {
      totalPrice = totalPrice! - product.price!.toInt();
    }
    context.read<CartBloc>().add(CartUpdateQuantity(quantity: count, index: index, secondIndex: secondIndex));
  }

  void onIncrease(int index, int secondIndex, CartProductModel product, int count, CartModel list) {
    product.quantity = count.toString();

    if (product.selected!) {
      totalPrice = totalPrice! + product.price!.toInt();
    }
    context.read<CartBloc>().add(CartUpdateQuantity(quantity: count, index: index, secondIndex: secondIndex));
  }

  //  total select price as a function

  void totalSelectPrice(int index, int secondIndex, int count) {
    countTotalPrice = count;
  }

  // only select one store
  void selectOneStore(int index, int secondIndex, int count) {
    valueChange = true;
  }

  void calculateTotalPrice(CartModel list) {
    totalPrice = 0;
    countSelected = 0;
    cartModel = list;
    for (int i = 0; i < list.products!.length; i++) {
      if (list.products![i].selected!) {
        totalPrice = totalPrice! + list.products![i].price!.toInt() * int.parse(list.products![i].quantity!);
        countSelected++;
      }
    }
    // setState(() {});
  }

  // if selected all true , then isSelected will be true
  void selectAll(CartModel list) {
    if (list.products!.every((element) => element.selected == true)) {
      valueChange = true;
    } else {
      valueChange = false;
    }
  }

  String? discount;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Text('My Cart'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<CartBloc>().add(CartClearEvent());
              },
              icon: Icon(CupertinoIcons.delete_solid)),
        ],
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          // if (state is CartInitial) {
          //   context.loaderOverlay.show();
          // }
          if (state is CartDeleteProductAtIndex) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text('Item deleted successfully'),
                ),
              );
            context.read<CartBloc>().add(CartFetchEvent());
          } else if (state is CartClear) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text('Cart cleared successfully'),
                ),
              );
            context.read<CartBloc>().add(CartFetchEvent());
          } else if (state is CartSuccess) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text('Item added successfully'),
                ),
              );
          } else if (state is CartLoaded) {
            context.loaderOverlay.hide();
          } else if (state is CartUpdateQuantity) {
            context.loaderOverlay.hide();
          }
        },
        buildWhen: (previous, current) {
          if (current is CartSuccess && previous is CartLoaded) {
            return false;
          } else {
            return true;
          }
        },
        builder: (context, state) {
          if (state is CartInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CartLoaded) {
            return state.data.items!.isNotEmpty
                ? Scaffold(
                    body: RefreshIndicator.adaptive(
                      onRefresh: () async {
                        context.read<CartBloc>().add(CartFetchEvent());
                      },
                      child: SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSizeExtraSmall(),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: Dimensions.paddingSizeSmall()),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.data.items!.length,
                                itemBuilder: (context, firstIndex) {
                                  return Container(
                                    decoration: CustomConstantWidget.shadowBoxDecorationWidget(
                                      radius: 15,
                                      color: AppColors.whiteColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: state.data.items![firstIndex].totalSelected!,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  state.data.items![firstIndex].totalSelected = value!;
                                                  calculateTotalPrice(state.data.items![firstIndex]);
                                                });
                                              },
                                              shape: const CircleBorder(
                                                side: BorderSide(color: AppColors.primary),
                                              ),
                                              side: const BorderSide(color: AppColors.primary),
                                              activeColor: AppColors.primary,
                                            ),
                                            Expanded(
                                              child: Text(
                                                state.data.items![firstIndex].storeName!,
                                              ),
                                            ),
                                          ],
                                        ),
                                        ListView.separated(
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: state.data.items![firstIndex].products!.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, secondIndex) {
                                            discount = state.data.items![firstIndex].products![secondIndex].discount!;
                                            return SlidableWidget(
                                              onPressedOne: (context) {
                                                context.read<CartBloc>().add(CartDeleteProductAtIndex(
                                                    index: firstIndex, secondIndex: secondIndex));
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.only(bottom: 10),
                                                child: Stack(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        // if which index item is selected then the other index will disable to select
                                                        Checkbox(
                                                          value: state.data.items![firstIndex].products![secondIndex].selected!,
                                                          onChanged: (bool? value) {
                                                            CartProductModel list = CartProductModel();
                                                            CartModel listCart = CartModel();
                                                            setState(() {
                                                              state.data.items![firstIndex].products![secondIndex]
                                                                  .selected = value!;
                                                            });
                                                            if (state.data.items![firstIndex].products![secondIndex]
                                                                    .selected ==
                                                                true) {
                                                              list =
                                                                  state.data.items![firstIndex].products![secondIndex];
                                                              listCart = state.data.items![firstIndex];
                                                            } else if (state.data.items![firstIndex]
                                                                    .products![secondIndex].selected ==
                                                                false) {
                                                              list =
                                                                  state.data.items![firstIndex].products![secondIndex];
                                                              listCart = state.data.items![firstIndex];
                                                            }
                                                            calculateTotalPrice(listCart);

                                                            // else {
                                                            //   cartModel!.products!.remove(state.data.items![firstIndex].products![secondIndex]);
                                                            // }
                                                          },
                                                          shape: const CircleBorder(
                                                            side: BorderSide(color: AppColors.primary),
                                                          ),
                                                          side: const BorderSide(color: AppColors.primary),
                                                          activeColor: AppColors.primary,
                                                        ),
                                                        SizedBox(
                                                          width: Dimensions.paddingSizeExtraSmall(),
                                                        ),
                                                        SizedBox(
                                                          height: 90,
                                                          width: 90,
                                                          child: CustomCacheImageWidget(
                                                            imageUrl: state.data.items![firstIndex]
                                                                .products![secondIndex].productImage!,
                                                            radius: 10,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: Dimensions.paddingSizeSmall(),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  state.data.items![firstIndex].products![secondIndex]
                                                                      .productName!,
                                                                  style: Theme.of(context)
                                                                      .textTheme
                                                                      .bodyMedium!
                                                                      .copyWith(fontWeight: FontWeight.w500),
                                                                ),
                                                                const SizedBox(height: 5),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      '\$${state.data.items![firstIndex].products![secondIndex].price!}',
                                                                      style: Theme.of(context)
                                                                          .textTheme
                                                                          .bodyMedium!
                                                                          .copyWith(
                                                                            color: AppColors.redColor,
                                                                            fontWeight: FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 6,
                                                                    ),
                                                                    Text(
                                                                      '\៛${state.data.items![firstIndex].products![secondIndex].discount ?? ''}',
                                                                      style: Theme.of(context)
                                                                          .textTheme
                                                                          .bodySmall!
                                                                          .copyWith(
                                                                            color: AppColors.greyColor,
                                                                            fontWeight: FontWeight.w500,
                                                                            decoration: TextDecoration.lineThrough,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(height: 5),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  children: [
                                                                    Card(
                                                                      elevation: 0,
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(
                                                                          Dimensions.paddingSizeExtraSmall(),
                                                                        ),
                                                                      ),
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.symmetric(
                                                                            horizontal: 5.0, vertical: 2.0),
                                                                        child: Text(
                                                                          state.data.items![firstIndex]
                                                                              .products![secondIndex].unitType!,
                                                                          style: Theme.of(context).textTheme.bodySmall,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Positioned(
                                                      right: 12,
                                                      bottom: 12,
                                                      child: Row(
                                                        children: [
                                                          CustomCircleIcon(
                                                              radius: 15,
                                                              onTap: () {
                                                                int count = int.parse(state.data.items![firstIndex]
                                                                    .products![secondIndex].quantity!);
                                                                if (count > 1) {
                                                                  setState(() {
                                                                    count--;
                                                                  });
                                                                  onDecrease(
                                                                    firstIndex,
                                                                    secondIndex,
                                                                    count,
                                                                    state
                                                                        .data.items![firstIndex].products![secondIndex],
                                                                    state.data.items![firstIndex],
                                                                  );
                                                                }
                                                              },
                                                              icon: CupertinoIcons.minus),
                                                          Container(
                                                            width: 30,
                                                            height: 30,
                                                            alignment: Alignment.center,
                                                            margin: EdgeInsets.symmetric(horizontal: 15),
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(
                                                                Dimensions.paddingSizeExtraSmall(),
                                                              ),
                                                              border: Border.all(
                                                                color: AppColors.primary,
                                                                width: 0.8,
                                                              ),
                                                            ),
                                                            child: AnimatedFlipCounter(
                                                              value: int.parse(state.data.items![firstIndex]
                                                                  .products![secondIndex].quantity!),
                                                              // child: Text(
                                                              //   ,
                                                              //   style: const TextStyle(
                                                              //     color: AppColors.primary,
                                                              //     fontSize: 14,
                                                              //     fontWeight: FontWeight.w600,
                                                              //   ),
                                                              // ),
                                                            ),
                                                          ),
                                                          CustomCircleIcon(
                                                              radius: 15,
                                                              onTap: () {
                                                                int count = int.parse(state.data.items![firstIndex]
                                                                    .products![secondIndex].quantity!);
                                                                setState(() {
                                                                  count++;
                                                                });
                                                                onIncrease(
                                                                    firstIndex,
                                                                    secondIndex,
                                                                    state
                                                                        .data.items![firstIndex].products![secondIndex],
                                                                    count,
                                                                    state.data.items![firstIndex]);
                                                              },
                                                              icon: CupertinoIcons.add),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                SizedBox(
                                                  height: Dimensions.paddingSizeSmall(),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
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
                    ),
                    bottomNavigationBar: state.data.items!.isNotEmpty
                        ? Container(
                            height: 100,
                            margin: EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSizeExtraSmall(),
                              vertical: Dimensions.paddingSizeExtraSmall(),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Row(
                                //   children: [
                                //     Radio(
                                //       value: valueChange,
                                //       groupValue: valueChange,
                                //       onChanged: (value) {
                                //         setState(() {
                                //           valueChange = value;
                                //         });
                                //       },
                                //     ),
                                //     Text(
                                //       'Select All',
                                //       style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                //             fontSize: 16,
                                //           ),
                                //     ),
                                //   ],
                                // ),
                                Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Total: ',
                                              textAlign: TextAlign.left,
                                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                    fontSize: 16,
                                                    color: AppColors.greyColor,
                                                  ),
                                            ),
                                            Text(
                                              '\$${totalPrice}',
                                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                    fontSize: 16,
                                                    color: AppColors.redColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          'Order : ${countSelected}',
                                          textAlign: TextAlign.left,
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                fontSize: 16,
                                                color: AppColors.greyColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 16),
                                  ],
                                ),
                                AppButton.roundedFilledButton(
                                  context,
                                  onTap: () {
                                    if (context.read<AuthenticationBloc>().appToken.hasToken() == true) {
                                      if (state.data.items!.every((element) =>
                                          element.products!.every((element) => element.selected == true))) {
                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(
                                            SnackBar(
                                              content: Text('You can only select from one store'),
                                            ),
                                          );
                                      } else if (state.data.items!.every((element) =>
                                          element.products!.every((element) => element.selected == false))) {
                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(
                                            SnackBar(
                                              content: Text('Please select product'),
                                            ),
                                          );
                                      } else {
                                        if (totalPrice != 0) {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => CheckoutPage(
                                                cartModel: cartModel!,
                                                discount: discount!,
                                                totalPrice: totalPrice.toString(),
                                                quantity: countSelected.toString(),
                                                productId: [],
                                              ),
                                            ),
                                          );
                                        } else if (totalPrice == 0) {
                                          ScaffoldMessenger.of(context)
                                            ..hideCurrentSnackBar()
                                            ..showSnackBar(
                                              SnackBar(
                                                content: Text('Please select product'),
                                              ),
                                            );
                                        }
                                      }
                                    } else {
                                      AppDialog.errorDialog(context,
                                          title: 'Unauthorized access', content: 'Please login', afterOk: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute<LoginPage>(
                                            builder: (context) => const LoginPage(),
                                          ),
                                        );
                                      });
                                    }
                                  },
                                  text: 'Check Out',
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                  )
                : Center(
                    child: EmptyDataWidget(),
                  );
          } else if (state is CartFailed) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
