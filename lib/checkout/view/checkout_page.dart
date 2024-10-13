import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ecogrow_customer/checkout/checkout.dart';
import 'package:flutter_ecogrow_customer/data/model/cart_list_response_model.dart';
import 'package:flutter_ecogrow_customer/data/model/checkout_request_model.dart';
import 'package:flutter_ecogrow_customer/data/model/product_response_model.dart';
import 'package:flutter_ecogrow_customer/location/cubit/address/address_cubit.dart';
import 'package:flutter_ecogrow_customer/location/location.dart';
import 'package:flutter_ecogrow_customer/product_detail/view/widget/product_sort_list_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_constant_widget.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_bar_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_cache_image_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_container_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/global_text_field.dart';
import 'package:flutter_ecogrow_customer/shared/widget/my_separate.dart';
import 'package:flutter_ecogrow_customer/shared/widget/text_row_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage(
      {super.key,
      required this.cartModel,
      required this.totalPrice,
      required this.quantity,
      required this.productId,
      required this.discount});

  final CartModel cartModel;
  final String totalPrice;
  final String quantity;
  final String discount;
  final List<String> productId;

  static const String routePath = '/checkout';

  @override
  Widget build(BuildContext context) {
    return CheckoutView(
      cartModel: cartModel,
      totalPrice: totalPrice,
      quantity: quantity,
      productId: productId,
      discount: discount,
    );
  }
}

class CheckoutView extends StatefulWidget {
  const CheckoutView(
      {super.key,
      required this.cartModel,
      required this.totalPrice,
      required this.quantity,
      required this.productId,
      required this.discount});

  final CartModel cartModel;
  final String totalPrice;
  final String quantity;
  final String discount;
  final List<String> productId;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  void initState() {
    context.read<AddressCubit>().init();
    super.initState();
  }

  OrderDetail? orderDetail;
  List<OrderDetail> orderDetails = [];
  LatLng? latLng;

  // total price after discount and if it selected
  double get total {
    final total = int.parse(widget.totalPrice);
    final discount = int.parse(widget.discount);
    final totalDiscount = (total * discount) / 100;
    return total - totalDiscount;
  }

  // get subtotal price
  double get subTotal {
    final total = int.parse(widget.totalPrice);
    final discount = int.parse(widget.discount);
    final totalDiscount = (total * discount) / 100;
    return total - totalDiscount;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutInitial) {
          context.loaderOverlay.show();
        } else if (state is CheckoutSuccess) {
          context.loaderOverlay.hide();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
        } else if (state is CheckoutFailed) {
          context.loaderOverlay.hide();
          ScaffoldMessenger.of(context)
            ..showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
        } else {
          context.loaderOverlay.hide();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const AppBarWidget(
            title: 'Checkout',
          ),
          body: SizedBox(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  AppTitleWidget(
                    text: 'Delivery Address',
                    isRow: true,
                    widget: TextButton(
                        child: Text('Change'),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => LocationPage()),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<AddressCubit, AddressState>(
                    builder: (context, state) {
                      if (state is AddressInitial) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is AddressLoaded) {
                        latLng = LatLng(
                          double.parse(state.data.address!.where((element) => element.isDefault! == 1).first.latitude!),
                          double.parse(state.data.address!.where((element) => element.isDefault! == 1).first.latitude!),
                        );
                        return state.data.address!.isNotEmpty
                            ? CustomContainerWidget(
                                title: state.data.address!.where((element) => element.isDefault! == 1).first.title!,
                                subTitle: state.data.address!.where((element) => element.isDefault! == 1).first.address!,
                                leading: CircleAvatar(
                                  backgroundColor: AppColors.primary,
                                  radius: 16,
                                  child: Icon(
                                    Icons.location_on,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                trialing: SizedBox(),
                              )
                            : InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => LocationPage()),
                                  );
                                },
                                child: CustomContainerWidget(
                                  title: 'No Address',
                                  subTitle: 'Please add your address',
                                  leading: CircleAvatar(
                                    backgroundColor: AppColors.primary,
                                    radius: 25,
                                    child: Icon(
                                      Icons.location_on,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                  trialing: SizedBox(),
                                ),
                              );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const AppTitleWidget(
                    text: 'Shipping Method',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomContainerWidget(
                    title: 'Delivery Address',
                    subTitle: r'Free shipping for orders over $50',
                    leading: Radio(
                      value: 1,
                      groupValue: 1,
                      onChanged: (value) {},
                    ),
                    trialing: Text(
                      r'$5.00',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.redColor,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GlobalTextField(
                    textInputType: TextInputType.text,
                    controller: TextEditingController(),
                    hintText: 'Add a note to your order',
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const AppTitleWidget(text: 'Product (7)'),
                  const SizedBox(
                    height: 16,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.cartModel.products?.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (widget.cartModel.products?[index].selected != true) return SizedBox();
                      orderDetails = widget.cartModel.products!.map((e) {
                        return OrderDetail(
                          id: int.parse(e.productId!),
                          productId: int.parse(e.productId!),
                          unitTypeId: e.unitTypeId,
                          baseQty: e.stockQuantity!.toInt(),
                          orderQty: int.parse(e.quantity!),
                          price: e.price!.toInt(),
                          subTotal: e.price!.toInt(),
                        );
                      }).toList();
                      return ProductListWidget(
                        product: ProductModel(
                          id: int.parse(widget.cartModel.products![index].productId!),
                          productName: widget.cartModel.products![index].productName,
                          image: widget.cartModel.products![index].productImage,
                          price: widget.cartModel.products![index].price!.toInt(),
                          qty: int.parse(widget.cartModel.products![index].quantity!),
                          unitTypeName: widget.cartModel.products![index].unitType!,
                        ),
                      );
                    },
                  ),
                  const MySeparator(),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 12,
                    ),
                    decoration: CustomConstantWidget.shadowBoxDecorationWidget(
                      radius: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // use khmer currency
                        AppTitleWidget(
                          text: 'Total',
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        TextRowWidget(
                          title: 'Order',
                          subTitle: widget.totalPrice,
                        ),
                        // SizedBox(
                        //   height: 11,
                        // ),
                        // TextRowWidget(
                        //   title: 'Delivery Fee',
                        //   subTitle: '៛5000',
                        // ),
                        SizedBox(
                          height: 11,
                        ),
                        TextRowWidget(
                          title: 'Discount',
                          subTitle: '%${widget.discount}',
                        ),

                        SizedBox(
                          height: 11,
                        ),
                        MySeparator(),
                        SizedBox(
                          height: 11,
                        ),
                        TextRowWidget(
                          title: 'Total Payable',
                          titleStyle: Theme.of(context).textTheme.titleLarge,
                          subTitle: '៛${total}',
                          subTitleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: AppColors.redColor,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTitleWidget(text: 'Manual Payment'),
                  CustomContainerWidget(
                    title: 'Cash Payment ',
                    subTitle: 'Pay with cash',
                    leading: CustomCacheImageWidget(
                      imageUrl:
                          'https://static.vecteezy.com/system/resources/previews/012/184/580/original/cash-payment-outline-color-icon-vector.jpg',
                      width: 50,
                      height: 50,
                    ),
                    trialing: Radio(
                      value: 'cash',
                      groupValue: 'cash',
                      onChanged: (value) {},
                    ),
                    isShowDecoration: false,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 32,
              top: 16,
            ),
            decoration: CustomConstantWidget.shadowBoxDecorationWidget(
              radius: 20,
            ),
            child: AppButton.roundedFilledButton(
              context,
              onTap: () {
                final id = widget.productId;
                final sellerId = widget.cartModel.storeId;
                final product = widget.cartModel.products;
                // for (int i = 0; i < id.length; i++) {
                //   orderDetail = OrderDetail(
                //     id: int.parse(id[i]),
                //     productId: int.parse(product![i].productId!),
                //     unitTypeId: product[i].unitTypeId,
                //     baseQty: product[i].stockQuantity!.toInt(),
                //     orderQty: int.parse(product[i].quantity!),
                //     price: product[i].price!.toInt(),
                //     subTotal: product[i].price!.toInt(),
                //   );
                // }

                context.read<CheckoutCubit>().checkout(
                      checkoutRequestModel: CheckoutRequestModel(
                        latitude: latLng!.latitude,
                        longitude: latLng!.longitude,
                        sellerId: int.parse(sellerId!),
                        paymentId: 1,
                        description: 'kk',
                        discount: int.parse(widget.discount),
                        orderDetail: orderDetails,
                        grandTotal: total.toInt(),
                      ),
                    );
                for (int i = 0; i < orderDetails.length; i++) {
                  print('orderDetail: ${orderDetails[i].toJson()}');
                }
              },
              text: 'Payment',
            ),
          ),
        );
      },
    );
  }
}
