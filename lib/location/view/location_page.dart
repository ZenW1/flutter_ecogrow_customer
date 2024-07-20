import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  // List<Marker> myMarker = [];
  // LatLng? currentLocation = const LatLng(11.5621224, 104.9161445);
  // List<Placemark> locationAddress = [];
  // final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  Future<Position> getCurrentPosition() async {
    bool isServiceEnabled;
    LocationPermission permission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        unawaited(
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text('Location Permission'),
              content:
                  Text('Please enable location permission in your settings'),
              actions: [
                TextButton(
                  onPressed: Geolocator.openAppSettings,
                  child: Text('OK'),
                ),
              ],
            ),
          ),
        );
      }
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      } else if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.',);
      }
    }
    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  @override
  void initState() {
    context.read<LocationCubit>().getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Location'),
            actions: [
              IconButton(
                onPressed: () async {},
                icon: const Icon(Icons.location_on),
              ),
            ],
            leading: IconButton(
              onPressed: () {
                GoRouter.of(context).pushReplacement('/main');
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: SafeArea(
            child: GoogleMap(
              onTap: (LatLng latLng) async {
                // currentLocation = latLng;
                //   myMarker.add(
                //     Marker(
                //       markerId: const MarkerId('newLocation'),
                //       icon: BitmapDescriptor.defaultMarkerWithHue(
                //         BitmapDescriptor.hueRed,
                //       ),
                //       position: latLng,
                //       infoWindow: const InfoWindow(
                //         title: 'this is my new location',
                //         snippet: 'This is your location',
                //       ),
                //     ),
                //   );
                // locationAddress = await placemarkFromCoordinates(
                //   latLng.latitude,
                //   latLng.longitude,
                // );
                // setState(() {
                //
                // });

                await context.read<LocationCubit>().getOnTapData();
                setState(() {});
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  state.location.latitude,
                  state.location.longitude,
                ),
                zoom: 13,
              ),
              onMapCreated: context.read<LocationCubit>().controller.complete,
              markers: Set<Marker>.of(context.read<LocationCubit>().myMarker),
            ),
          ),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            color: Colors.blue,
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Latitude: ${state.location.latitude}, Longitude: ${state.location.longitude} ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '${state.locationAddress.isNotEmpty ? state.locationAddress.first.locality : ''}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
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
