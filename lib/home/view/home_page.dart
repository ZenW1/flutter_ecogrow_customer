import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/home/home.dart';
import 'package:flutter_ecogrow_customer/location/cubit/location_cubit.dart';
import 'package:flutter_ecogrow_customer/product/product.dart';
import 'package:flutter_ecogrow_customer/product_detail/view/widget/product_vertical_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_constant_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';
import 'package:flutter_ecogrow_customer/shared/constant/validator_extension.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_cache_image_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/test_animation.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../product_detail/product_detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routePath = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<ProductModel> productList = [
    // translate to khmer
    ProductModel(
      name: 'ខ្ទឹមបារាំង',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgIxB4TqKd66zyoFXx9QiHPP_bsfzq6xLPHA&s',
      condition: 'ស្រស់',
      price: '6000',
    ),
    ProductModel(
      name: 'ប៉េងប៉ោះ',
      imageUrl: 'https://m.media-amazon.com/images/I/313dtY-LOEL._AC_UF1000,1000_QL80_.jpg',
      condition: 'ស្រស់',
      price: '4000',
    ),
    ProductModel(
      name: 'ត្រសក់',
      imageUrl: 'https://www.fervalle.com/wp-content/uploads/2022/07/580b57fcd9996e24bc43c216-1024x869.png',
      condition: 'ស្រស់',
      price: '1500',
    ),
    ProductModel(
      name: 'ផ្លែបឺរ',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOvY2J8wtwxZDor81a79R1_9e93VaIEfNGOg&s',
      condition: 'ស្រស់',
      price: '7000',
    ),
    ProductModel(
      name: 'ការ៉ុត',
      imageUrl: 'https://bcfresh.ca/wp-content/uploads/2021/11/Carrots.jpg',
      condition: 'Fresh',
      price: '4500',
    ),
  ];

  // @override
  // void dispose() {
  //   context.read<HomeCubit>().scrollController.dispose();
  //   super.dispose();
  // }

  @override
  void didChangeDependencies() {
    // context.read<HomeCubit>().scrollController.initialScrollOffset;
    // context.read<HomeCubit>().controllerListener();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            shrinkWrap: true,
            cacheExtent: 1000,
            slivers: [
              SliverAppBar(
                expandedHeight: 50,
                floating: true,
                backgroundColor: AppColors.whiteColor,
                pinned: true,
                flexibleSpace: SafeArea(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeSmall(),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.filter_list,
                          size: Dimensions.iconSizeLarge(),
                        ),
                        SizedBox(width: Dimensions.paddingSizeDefault()),
                        InkWell(
                          onTap: () {
                            context.read<LocationCubit>().getCurrentLocation();
                            GoRouter.of(context).go('/location');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                'Phnom Penh Cambodia',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context).pushNamed('/cart');
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => TestAnimation()));
                          },
                          child: Icon(
                            Icons.shopping_cart_rounded,
                            color: AppColors.primary,
                            size: Dimensions.iconSizeDefault(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
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
                            height: 150,
                            child: ListView.separated(
                              shrinkWrap: true,
                              controller: context.read<HomeCubit>().scrollController,
                              scrollDirection: Axis.horizontal,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: context.read<HomeCubit>().data.length,
                              addRepaintBoundaries: false,
                              itemBuilder: (context, index) {
                                final data = context.read<HomeCubit>().data[index];
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomCacheImageWidget(
                                      imageUrl: data.imageUrl,
                                      width: 110,
                                      height: 90,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${data.price}៛/${data.weight}',
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                            color: AppColors.greyColor,
                                          ),
                                    ),
                                    Text(
                                      data.title,
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
                      SizedBox(
                        height: 16,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 150,
                        child: AnimatedSmoothIndicator(
                          activeIndex: state.currentIndex!,
                          count: 3,
                          effect: const ExpandingDotsEffect(
                            activeDotColor: AppColors.primary,
                            dotColor: AppColors.primary,
                            dotHeight: 8,
                            dotWidth: 8,
                            expansionFactor: 4,
                            spacing: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                    margin: EdgeInsets.all(Dimensions.paddingSizeSmall()),
                    child: ProductPage()),
              ),
              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(
              //       horizontal: Dimensions.paddingSizeSmall(),
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         SizedBox(
              //           height: Dimensions.paddingSizeSmall(),
              //         ),
              //         AppTitleWidget(
              //           text: 'ផលិតផលបញ្ចុះតម្លៃ',
              //           isRow: true,
              //           widget: Text(
              //             'See all',
              //             style:
              //                 Theme.of(context).textTheme.titleMedium!.copyWith(
              //                       color: AppColors.primary,
              //                       fontWeight: FontWeight.w500,
              //                     ),
              //           ),
              //         ),
              //         ConstrainedBox(
              //           constraints: const BoxConstraints(
              //             maxHeight: 250,
              //             minHeight: 140,
              //           ),
              //           child: ListView.builder(
              //             scrollDirection: Axis.horizontal,
              //             padding: EdgeInsets.symmetric(
              //               vertical: Dimensions.paddingSizeSmall(),
              //             ),
              //             shrinkWrap: true,
              //             itemCount: productList.length,
              //             itemBuilder: (context, index) {
              //               return OpenContainer(
              //                 transitionType:
              //                     ContainerTransitionType.fadeThrough,
              //                 tappable: true,
              //                 transitionDuration: Duration(milliseconds: 450),
              //                 openColor: Colors.white,
              //                 closedColor: Colors.white,
              //                 closedElevation: 0,
              //                 openElevation: 0,
              //                 openShape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(16),
              //                 ),
              //                 middleColor: Colors.white,
              //                 closedShape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(16),
              //                 ),
              //                 openBuilder: (context, __) {
              //                   return ProductDetailPage();
              //                 },
              //                 closedBuilder: (BuildContext context,
              //                     VoidCallback openContainer) {
              //                   return ProductVerticalWidget(
              //                     onTap: () {
              //                       openContainer();
              //                     },
              //                     product: productList[index],
              //                     isPromotion: true,
              //                   );
              //                 },
              //               );
              //             },
              //           ),
              //         ),
              //         // SizedBox(height: Dimensions.paddingSizeDefault()),
              //         // ConstrainedBox(
              //         //   constraints: const BoxConstraints(
              //         //     maxHeight: 140,
              //         //     minHeight: 100,
              //         //   ),
              //         //   child: ListView.builder(
              //         //     scrollDirection: Axis.horizontal,
              //         //     padding: EdgeInsets.symmetric(
              //         //       vertical: Dimensions.paddingSizeSmall(),
              //         //     ),
              //         //     shrinkWrap: true,
              //         //     itemCount: context.read<CategoryCubit>().categoryList.length,
              //         //     itemBuilder: (context, index) {
              //         //       return CategoryItemWidget(
              //         //         categoryItemModel: context.read<CategoryCubit>().categoryList[index],
              //         //         onTap: () {},
              //         //       );
              //         //     },
              //         //   ),
              //         // ),
              //         // SizedBox(height: Dimensions.paddingSizeDefault()),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}

class ProductModel {
  ProductModel({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.condition,
    this.description,
    this.quantity,
    this.variety,
    this.weight,
    this.category,
  });

  final String name;
  final String imageUrl;
  final String? condition;
  final String price;
  final String? description;

  final String? quantity;
  final String? variety;
  final String? weight;
  final String? category;
}
