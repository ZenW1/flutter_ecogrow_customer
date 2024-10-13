import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/data/model/product_recent_response_model.dart';
import 'package:flutter_ecogrow_customer/home/cubit/home_cubit.dart';
import 'package:flutter_ecogrow_customer/product/bloc/product_bloc.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_constant_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_cache_image_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductTodayPage extends StatefulWidget {
  const ProductTodayPage({super.key});

  @override
  State<ProductTodayPage> createState() => _ProductTodayPageState();
}

class _ProductTodayPageState extends State<ProductTodayPage> {

  @override
  void initState() {
    // context.read<ProductBloc>().add(FetchProductRecentEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductInitial) {
          return Skeletonizer(enabled: true, child: ProductTodayView(data: ProductRecentResponseModel(data: [
            ProductRecentModel(
              id: 1,
              productName: 'បន្ទប់ទឹកដោយស្រូវ',
              price: 10000,
              unitTypeName: 'កញ្ចប់',
              image: 'https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg',
            ),
            ProductRecentModel(
              id: 2,
              productName: 'បន្ទប់ទឹកដោយស្រូវ',
              price: 10000,
              unitTypeName: 'កញ្ចប់',
              image: 'https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg',
            ),
            ProductRecentModel(
              id: 3,
              productName: 'បន្ទប់ទឹកដោយស្រូវ',
              price: 10000,
              unitTypeName: 'កញ្ចប់',
              image: 'https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg',
            ),
            ProductRecentModel(
              id: 4,
              productName: 'បន្ទប់ទឹកដោយស្រូវ',
              price: 10000,
              unitTypeName: 'កញ្ចប់',
              image: 'https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg',
            ),
          ])));
        } else if (state is ProductRecentLoaded) {
          return ProductTodayView(data: state.data);
        } else if (state is ProductFailure) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class ProductTodayView extends StatelessWidget {
  const ProductTodayView({super.key, required this.data});

  final ProductRecentResponseModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.paddingSizeSmall(),
        right: Dimensions.paddingSizeSmall(),
        top: Dimensions.paddingSizeDefault(),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSizeSmall(),
        vertical: Dimensions.paddingSizeDefault(),
      ),
      decoration: CustomConstantWidget.shadowBoxDecorationWidget(
        radius: 24,
        color: AppColors.whiteColor,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              AppTitleWidget(
                text: 'តម្លៃលក់ថ្ងៃនេះ',
                fontWeight: FontWeight.w600,
                isRow: true,
                widget: InkWell(
                  onTap: () {},
                  child: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              SizedBox(
                height: 160,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: data.data!.length,
                  addRepaintBoundaries: false,
                  itemBuilder: (context, index) {
                    final productData = data.data![index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomCacheImageWidget(
                          imageUrl: productData.image.toString(),
                          width: 110,
                          height: 90,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${productData.price}៛/${productData.unitTypeName}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.greyColor,
                              ),
                        ),
                        Text(
                          productData.productName.toString(),
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        SizedBox(
                          height: 16,
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 16);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
