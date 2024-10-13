import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/data/model/address_model.dart';
import 'package:flutter_ecogrow_customer/location/cubit/address/address_cubit.dart';
import 'package:flutter_ecogrow_customer/location/location.dart';
import 'package:flutter_ecogrow_customer/location/view/google_map_page.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_constant_widget.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_dialog.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_container_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/emtpy_data_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/global_text_field.dart';
import 'package:flutter_ecogrow_customer/shared/widget/slidable_widget.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  static const String routePath = '/location';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocationCubit(),
      child: const LocationView(),
    );
  }
}

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  LatLng latLng = const LatLng(11.5564, 104.9282);
  List<Placemark>? placeMark;

  int valueChange = 1;

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

    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    latLng = LatLng(position.latitude, position.longitude);

    placeMark = await placemarkFromCoordinates(position.latitude, position.longitude);

    return position;
  }

  void fetchData() {
    Future.wait(
      [
        context.read<AddressCubit>().init(),
        context.read<LocationCubit>().getPlaceMark(),
      ],
    );
  }

  GoogleMapController? googleMapController;

  @override
  void initState() {
    fetchData();
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state is AddressLoaded) {
          context.loaderOverlay.hide();
        } else if (state is AddressDelete) {
          context.read<AddressCubit>().init();
          context.loaderOverlay.hide();
        } else if (state is AddressSuccess) {
          context.read<AddressCubit>().init();
          context.loaderOverlay.hide();
        } else if (state is AddressFailed) {
          context.loaderOverlay.hide();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Location'),
            actions: [
              IconButton(
                onPressed: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute<GoogleMapPage>(
                      builder: (context) => GoogleMapPage(
                        latLng: latLng,
                        isEdit: false,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.location_on),
              ),
            ],
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppTitleWidget(text: 'Choose your delivery location'),
                    const SizedBox(height: 14),
                    Text(
                      'les’s find your unforgettable event. Choose your location below ti get started.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.greyColor,
                          ),
                    ),
                    const SizedBox(height: 16),
                    const AppTitleWidget(text: 'Note your Address'),
                    const SizedBox(height: 16),
                    GlobalTextField(
                      textInputType: TextInputType.text,
                      controller: TextEditingController(),
                      hintText: 'Enter your address',
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 250,
                      decoration: CustomConstantWidget.shadowBoxDecorationWidget(
                        radius: 20,
                      ),
                      width: double.infinity,
                      child: GoogleMap(
                        onCameraMoveStarted: () {
                          print('Camera move started');
                        },
                        onCameraMove: (CameraPosition cameraPosition) {},
                        onTap: (LatLng latLng) async {
                          Navigator.of(context).push(
                            MaterialPageRoute<GoogleMapPage>(
                              builder: (context) => GoogleMapPage(
                                latLng: latLng,
                                isEdit: false,
                                id: '',
                              ),
                            ),
                          );
                        },
                        initialCameraPosition: CameraPosition(
                          target: latLng,
                          zoom: 13,
                        ),
                        onMapCreated: (controller) {
                          googleMapController = controller;
                        },
                        markers: {
                          Marker(
                            markerId: const MarkerId('voatPhnom'),
                            position: latLng,
                            infoWindow: const InfoWindow(
                              title: 'Voat Phnom',
                              snippet: 'This is Voat Phnom',
                            ),
                          ),
                        },
                      ),
                    ),
                    state is AddressLoaded
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              const AppTitleWidget(
                                text: 'Your Location',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (state is AddressInitial) ...[
                                const Center(
                                  child: CircularProgressIndicator(),
                                )
                              ] else ...[
                                getSavedLocation(
                                  data: state.data,
                                  val: (index) {
                                    context.read<AddressCubit>().setDefaultAddress(id: index);
                                  },
                                )
                              ]
                            ],
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 32,
            ),
            child: AppButton.roundedFilledButton(
              context,
              text: 'Save Location',
              onTap: () {
                GoRouter.of(context).pushReplacement('/main');
              },
            ),
          ),
        );
      },
    );
  }

  Widget getSavedLocation({
    required AddressResponseModel data,
    required Function(int) val,
  }) {
    return data.address!.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.address?.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<GoogleMapPage>(
                      builder: (context) => GoogleMapPage(
                        isEdit: true,
                        id: data.address![index].id!.toString(),
                        latLng: LatLng(double.parse(data.address![index].latitude!),
                            double.parse(data.address![index].longitude!)),
                      ),
                    ),
                  );
                },
                child: SlidableWidget(
                  onPressedOne: (context) {
                    context.read<AddressCubit>().deleteAddresss(id: data.address![index].id!.toString());
                  },
                  child: CustomContainerWidget(
                    title: data.address![index].title!,
                    subTitle: data.address![index].address!,
                    leading: const CircleAvatar(
                      backgroundColor: AppColors.greyColor,
                      child: Icon(Icons.home),
                    ),
                    trialing: Radio(
                      value: data.address![index].isDefault,
                      groupValue: valueChange,
                      onChanged: (value) {
                        value = valueChange;
                        setState(() {
                          context.read<AddressCubit>().updateAddress(
                                id: data.address![index].id!.toString(),
                                latitude: data.address![index].latitude!,
                                longitude: data.address![index].longitude!,
                                title: data.address![index].title!,
                                address: data.address![index].address!,
                                description: data.address![index].description!,
                                isDefault: '1',
                              );
                        });
                      },
                    ),
                  ),
                ),
              );
            },
          )
        : Center(
            child: EmptyDataWidget(
              title: 'No Address Found',
            ),
          );
  }
}
