import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/location/cubit/address/address_cubit.dart';
import 'package:flutter_ecogrow_customer/location/cubit/current_address/current_address_bloc.dart';
import 'package:flutter_ecogrow_customer/location/location.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_dialog.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/global_text_field.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum TaskType { home, work, school, shopping, others }

class GoogleMapPage extends StatefulWidget {
  GoogleMapPage({super.key, required this.latLng,required this.isEdit, this.id});

  LatLng? latLng;
  final String? id;
  final bool isEdit;

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  late CurrentAddressBloc bloc;
  LatLng? latLng;
  LatLng? currentLatLng;

  String? getTaskType;

  @override
  void initState() {
    // bloc = context.read<CurrentAddressBloc>();
    latLng = widget.latLng!;
    currentLatLng = widget.latLng!;
    context.read<CurrentAddressBloc>()..add(CurrentAddressInit());

    super.initState();
  }

  List<CategoryModel> categories = [
    CategoryModel(categories: 'Work', isSelected: false),
    CategoryModel(categories: 'Home', isSelected: false),
    CategoryModel(categories: 'School', isSelected: false),
    CategoryModel(categories: 'Shopping', isSelected: false),
    CategoryModel(categories: 'Others', isSelected: false),
  ];

  Set<TaskType> selection = <TaskType>{};

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

    return position;
  }

  // final locationMarkerAsset =
  // BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);

  var currentAddressName = "";
  var currentAddress = Placemark();

  // on camera move
  onCameraMove(CameraPosition cameraPosition) async {
    LatLng processingLatLng = LatLng(cameraPosition.target.latitude, cameraPosition.target.longitude);
    currentLatLng = LatLng(cameraPosition.target.latitude, cameraPosition.target.longitude);

    //Delay the process to see if lng lat change
    await Future.delayed(Duration(milliseconds: 500));

    //Get address if nothing change for 1 second
    if (processingLatLng.latitude == currentLatLng!.latitude &&
        processingLatLng.longitude == currentLatLng!.longitude) {
      try {
        currentAddress = (await placemarkFromCoordinates(processingLatLng.latitude, processingLatLng.longitude)).first;
        // currentAddress = await GeoCode().reverseGeocoding(latitude: processingLatLng.latitude, longitude: processingLatLng.longitude);

        List<Placemark> placeMarks =
            await placemarkFromCoordinates(processingLatLng.latitude, processingLatLng.longitude);

        currentAddress = placeMarks.first;
        currentAddressName = "${currentAddress.name} ${currentAddress.subLocality}, ${currentAddress.locality}";
      } catch (error) {
        print("Map: ${error.toString()}");
      }
      setState(() {});
    } else {
      return;
    }
  }

  final double defaultZoomLevel = 18;

  late GoogleMapController googleMapController;

  onMapCreated(GoogleMapController mapController) {
    googleMapController = mapController;

    // if (existingData != null) {
    //   CameraPosition userCameraPosition = CameraPosition(
    //     target: LatLng(existingData!.lat!, existingData!.lng!),
    //     zoom: defaultZoomLevel,
    //   );
    //
    //   requestBody = ShippingAddressEntity.fromJson(existingData!.toJson());

    CameraPosition userCameraPosition = CameraPosition(
      target: widget.latLng!,
      zoom: defaultZoomLevel,
    );

    googleMapController.moveCamera(CameraUpdate.newCameraPosition(userCameraPosition));
    onCameraMove(userCameraPosition);
  }

  // marker with new lat lng
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: onMapCreated,
            onCameraMove: onCameraMove,
            initialCameraPosition: CameraPosition(
              target: widget.latLng!,
              zoom: 13,
            ),
            onTap: (latLng) {
              context.read<CurrentAddressBloc>().getCurrentAddressLocation(lat: latLng.latitude, lng: latLng.longitude);
            },
            // minMaxZoomPreference: MinMaxZoomPreference(10, 20),
            // mapToolbarEnabled: true,
            // markers: {
            //   Marker(
            //     markerId: MarkerId('voatPhnom'),
            //     position:widget.latLng!,
            //     icon: locationMarkerAsset,
            //     infoWindow: const InfoWindow(
            //       title: 'Voat Phnom',
            //       snippet: 'This is Voat Phnom',
            //     ),
            //   ),
            // },
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Icon(
                Icons.location_on,
                size: 40,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 30,
            child: AppButton.circleButton(
              context,
              onTap: () {
                Navigator.pop(context);
              },
              icon: Icons.close,
            ),
          ),
        ],
      ),
      bottomSheet: SingleChildScrollView(
        child: Container(
          height: 350,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.lightGreyColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Your delivery will be delivery to your pinned location ,\n you can edit your written address for more accuracy',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      textWidthBasis: TextWidthBasis.longestLine,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const AppTitleWidget(
                text: 'Add new address',
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(
                    width: 10,
                  ),
                  // if (state is CurrentAddressLoaded)
                  //   Text(
                  //     '${state.placeMarks!.first.name} ${state.placeMarks!.first.subLocality}, ${state.placeMarks!.first.locality}',
                  //     softWrap: false,
                  //     textWidthBasis: TextWidthBasis.longestLine,
                  //     style: Theme.of(context).textTheme.titleLarge,
                  //     textHeightBehavior: const TextHeightBehavior(
                  //       applyHeightToFirstAscent: false,
                  //       applyHeightToLastDescent: false,
                  //     ),
                  //   ),
                  Text(
                    currentAddressName,
                    softWrap: false,
                    textWidthBasis: TextWidthBasis.longestLine,
                    style: Theme.of(context).textTheme.titleLarge,
                    textHeightBehavior: const TextHeightBehavior(
                      applyHeightToFirstAscent: false,
                      applyHeightToLastDescent: false,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.edit),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const AppTitleWidget(
                text: "We're missing your description",
              ),
              const SizedBox(
                height: 16,
              ),
              GlobalTextField(
                textInputType: TextInputType.text,
                controller: context.read<CurrentAddressBloc>().addressController,
                hintText: 'Add description',
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: SegmentedButton(
                  emptySelectionAllowed: true,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.primary.withOpacity(0.8),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  segments: const <ButtonSegment<TaskType>>[
                    ButtonSegment(
                      value: TaskType.home,
                      label: Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ButtonSegment(
                      value: TaskType.work,
                      label: Text(
                        'Work',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ButtonSegment(
                      value: TaskType.school,
                      label: Text(
                        'School',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ButtonSegment(
                      value: TaskType.others,
                      label: Text(
                        'Others',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                  multiSelectionEnabled: false,
                  selected: selection,
                  onSelectionChanged: (Set<TaskType> newSelection) {
                    setState(() {
                      selection = newSelection;
                      if (selection.contains(TaskType.home)) {
                        getTaskType = 'Home';
                      } else if (selection.contains(TaskType.school)) {
                        getTaskType = 'School';
                      } else if (selection.contains(TaskType.work)) {
                        getTaskType = 'Work';
                      } else if (selection.contains(TaskType.others)) {
                        getTaskType = 'Other';
                      }
                    });
                  },
                ),
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
        child: AppButton.roundedFilledButton(
          context,
          onTap: () {
            if(widget.isEdit == false){
              context.read<AddressCubit>().saveAddress(
                latitude: latLng!.latitude.toString(),
                longitude: latLng!.longitude.toString(),
                title: getTaskType!,
                address: currentAddressName,
                description: context.read<CurrentAddressBloc>().addressController.text,
              );
            } else {
              context.read<AddressCubit>().updateAddress(
                id: widget.id!,
                latitude: latLng!.latitude.toString(),
                longitude: latLng!.longitude.toString(),
                title: getTaskType!,
                address: currentAddressName,
                description: context.read<CurrentAddressBloc>().addressController.text,
                isDefault: '1',
              );
            }
            context.read<AddressCubit>().init();
            Navigator.of(context).pop();
          },
          text: 'Save Address',
        ),
      ),
    );
  }
}

class CategoryModel {
  late final String categories;
  bool isSelected;

  CategoryModel({required this.categories, required this.isSelected});
}
