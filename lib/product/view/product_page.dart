import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/data/model/product_list_response_model.dart';
import 'package:flutter_ecogrow_customer/data/repo/product_repo.dart';
import 'package:flutter_ecogrow_customer/product/view/product_display_view.dart';
import 'package:flutter_ecogrow_customer/product/view/product_promotion_view.dart';
import 'package:flutter_ecogrow_customer/product_detail/view/product_detail_page.dart';
import 'package:flutter_ecogrow_customer/product_detail/view/widget/product_vertical_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(
        context.read<ProductRepo>(),
      )..add(FetchProductEvent()),
      child: const ProductView(),
    );
  }
}

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded) {
          return Column(
            children: [
              AppTitleWidget(
                text: 'បន្លែធម្មជាតិ',
                isRow: true,
                widget: Text(
                  'See all',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              // SizedBox(height: Dimensions.paddingSizeDefault()),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 250,
                  minHeight: 140,
                  maxWidth: double.infinity,
                  minWidth: double.infinity,
                ),
                child: ProductPromotionView(
                  data: state.data,
                ),
              ),
              AppTitleWidget(
                text: 'ផលិតផលបញ្ចុះតម្លៃ',
                isRow: true,
                widget: Text(
                  'See all',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              ProductDisplayView(data: state.data),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
