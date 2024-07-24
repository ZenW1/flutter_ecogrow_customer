
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/location/cubit/location_cubit.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  @override
  void initState() {
    context.read<LocationCubit>().getCurrentLocation(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                onCameraMoveStarted: () {
                  print('Camera move started');

                },
                onCameraMove: (CameraPosition cameraPosition) {
                  context.read<LocationCubit>().getDataWhenCameraMove(
                        cameraPosition,
                      );
                },
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

                  // await context.read<LocationCubit>().getOnTapData(latLng);
                },
                initialCameraPosition: CameraPosition(
                  target: state.location!,
                  zoom: 13,
                ),
                onMapCreated: context.read<LocationCubit>().controller.complete,
                markers: Set<Marker>.of(state.myMarker!),
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
          bottomNavigationBar: Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            color: Colors.blue,
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Latitude: ${state.location!.latitude}, Longitude: ${state.location!.longitude} ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    state.placemarks!.isNotEmpty ?  context.read<LocationCubit>().getLocationAddress() : 'No address',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
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
