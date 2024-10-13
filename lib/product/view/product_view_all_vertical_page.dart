import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/data/model/product_response_model.dart';
import 'package:flutter_ecogrow_customer/product/bloc/product_bloc.dart';
import 'package:flutter_ecogrow_customer/product/product.dart';
import 'package:flutter_ecogrow_customer/product_detail/view/product_detail_page.dart';
import 'package:flutter_ecogrow_customer/product_detail/view/widget/product_vertical_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';
import 'package:flutter_ecogrow_customer/shared/widget/emtpy_data_widget.dart';

class ProductViewAllVerticalPage extends StatefulWidget {
  const ProductViewAllVerticalPage({super.key, required this.id});

  final int id;

  @override
  State<ProductViewAllVerticalPage> createState() => _ProductViewAllVerticalPageState();
}

class _ProductViewAllVerticalPageState extends State<ProductViewAllVerticalPage> {

  @override
  void initState() {
    context.read<ProductBloc>()..add(ProductByCategoryEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoaded) {
            return ProductViewAllVerticalView(data: state.data,);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}


class ProductViewAllVerticalView extends StatelessWidget {
  const ProductViewAllVerticalView({super.key,required this.data});

  final ProductResponseModel data;

  @override
  Widget build(BuildContext context) {
    return data.data!.isNotEmpty ?
    GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.paddingSizeSmall(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: data.data!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // CustomProductShowButtomSheet.showBottomSheet;
          },
          child: ProductVerticalWidget(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                    id: data.data![index].id.toString(),
                  ),
                ),
              );
            },
            product: data.data![index],
            isPromotion: false,
          ),
        );
      },
    ) : Center(child: EmptyDataWidget());
  }
}


