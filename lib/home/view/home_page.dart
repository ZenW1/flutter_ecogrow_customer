import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/home/home.dart';
import 'package:flutter_ecogrow_customer/location/cubit/location_cubit.dart';
import 'package:flutter_ecogrow_customer/location/view/location_page.dart';
import 'package:flutter_ecogrow_customer/product/bloc/product_bloc.dart';
import 'package:flutter_ecogrow_customer/product/product.dart';
import 'package:flutter_ecogrow_customer/product/view/product_today_page.dart';
import 'package:flutter_ecogrow_customer/search/search.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_dialog.dart';
import 'package:flutter_ecogrow_customer/shared/constant/dimensions.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  List<Placemark>? placeMark;

  Future<String> locationAddress({required LatLng latLng}) async {
    placeMark = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    return placeMark!.first.locality!;
  }

  LatLng latLng = LatLng(0, 0);

  Future<Position> _getCurrentLocation() async {
    bool isServiceEnabled;
    LocationPermission permission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      // open settings

      if (permission == LocationPermission.deniedForever) {
        unawaited(
          CustomDialog.showErrorDialog(
            'Location permissions are permanently denied, we cannot request permissions., Open Settings, Cancel',
          ),
        );
      }
    }

    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
    latLng = LatLng(position.latitude, position.longitude);

    placeMark = await placemarkFromCoordinates(position.latitude, position.longitude);
    locationAddress(latLng: LatLng(position.latitude, position.latitude));
    return position;
  }

  Future<void> fetchData() async {
    _getCurrentLocation();
    context.read<LocationCubit>().getCurrentLocation();
    context.read<ProductBloc>()..add(FetchProductEvent());
    context.read<ProductBloc>()..add(FetchProductRecentEvent());
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
              fetchData();
            },
            child: CustomScrollView(
              shrinkWrap: true,
              cacheExtent: 1000,
              slivers: [
                SliverAppBar(
                  expandedHeight: 50,
                  floating: true,
                  backgroundColor: AppColors.whiteColor,
                  pinned: true,
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<SearchPage>(
                              builder: (context) => SearchPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.search)),
                  ],
                  flexibleSpace: SafeArea(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSizeSmall(),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColors.primary.withOpacity(0.2),
                            child: Icon(
                              Icons.location_on_rounded,
                              color: AppColors.primary,
                              size: Dimensions.iconSizeLarge(),
                            ),
                          ),
                          SizedBox(width: Dimensions.paddingSizeSmall()),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<LocationPage>(
                                  builder: (context) => LocationPage(),
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Current location',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  placeMark != null ? placeMark!.first.locality! : 'loading...',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ProductTodayPage(),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.all(Dimensions.paddingSizeSmall()),
                    child: ProductPage(),
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
