import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/location/cubit/address/address_cubit.dart';
import 'package:flutter_ecogrow_customer/location/cubit/current_address/current_address_bloc.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_dialog.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/global_text_field.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  late CurrentAddressBloc bloc;
  LatLng latLng = LatLng(11.562108, 104.888535);

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

    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latLng = LatLng(position.latitude, position.longitude);

    return position;
  }

  final locationMarkerAsset =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);

  var currentAddressName = "";
  var currentAddress = Placemark();
  var currentLatLng = LatLng(0, 0);

  // on camera move
  onCameraMove(CameraPosition cameraPosition) async {
    LatLng processingLatLng =
        LatLng(cameraPosition.target.latitude, cameraPosition.target.longitude);
    currentLatLng =
        LatLng(cameraPosition.target.latitude, cameraPosition.target.longitude);

    //Delay the process to see if lng lat change
    await Future.delayed(Duration(milliseconds: 500));

    //Get address if nothing change for 1 second
    if (processingLatLng.latitude == currentLatLng.latitude &&
        processingLatLng.longitude == currentLatLng.longitude) {
      try {
        currentAddress = (await placemarkFromCoordinates(
                processingLatLng.latitude, processingLatLng.longitude))
            .first;
        // currentAddress = await GeoCode().reverseGeocoding(latitude: processingLatLng.latitude, longitude: processingLatLng.longitude);

        List<Placemark> placeMarks = await placemarkFromCoordinates(
            processingLatLng.latitude, processingLatLng.longitude);

        currentAddress = placeMarks.first;
        currentAddressName =
            "${currentAddress.name} ${currentAddress.subLocality}, ${currentAddress.locality}";
      } catch (error) {
        print("Map: ${error.toString()}");
      }
      setState(() {});
    } else {
      return;
    }
  }

  final LatLng initLatLng = LatLng(11.562108, 104.888535);
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
      target: LatLng(latLng.latitude, latLng.longitude),
      zoom: defaultZoomLevel,
    );

    googleMapController
        .moveCamera(CameraUpdate.newCameraPosition(userCameraPosition));
    onCameraMove(userCameraPosition);
  }

  // marker with new lat lng
  Set<Marker> markers = {};

  @override
  void initState() {
    // bloc = context.read<CurrentAddressBloc>();
    latLng = LatLng(11.562108, 104.888535);
    context.read<CurrentAddressBloc>()..add(CurrentAddressInit());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: onMapCreated,
            onCameraMove: onCameraMove,
            initialCameraPosition: CameraPosition(
              target: LatLng(11.562108, 104.888535),
              zoom: 13,
            ),
            onTap: (latLng) {
              context.read<CurrentAddressBloc>().getCurrentAddressLocation(
                  lat: latLng.latitude, lng: latLng.longitude);
            },
            // minMaxZoomPreference: MinMaxZoomPreference(10, 20),
            // mapToolbarEnabled: true,
            markers: {
              Marker(
                markerId: MarkerId('voatPhnom'),
                position: LatLng(11.562108, 104.888535),
                icon: locationMarkerAsset,
                infoWindow: const InfoWindow(
                  title: 'Voat Phnom',
                  snippet: 'This is Voat Phnom',
                ),
              ),
            },
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
      bottomSheet: Container(
        height: 300,
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
              text: "We're missing your address",
            ),
            const SizedBox(
              height: 16,
            ),
            GlobalTextField(
              textInputType: TextInputType.text,
              controller: context.read<CurrentAddressBloc>().addressController,
              hintText: 'House numbers',
            ),
          ],
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
            context.read<AddressCubit>().saveAddress(
                  latitude: latLng.latitude.toString(),
                  longitude: latLng.longitude.toString(),
                  title: 'Home',
                  address: currentAddressName,
                  description:
                      context.read<CurrentAddressBloc>().addressController.text,
                );
            context.read<CurrentAddressBloc>().addressController.clear();
            context.read<AddressCubit>().init();
            Navigator.pop(context);
          },
          text: 'Save Address',
        ),
      ),
    );
  }
}
