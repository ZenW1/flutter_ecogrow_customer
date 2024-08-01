import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationState(const LatLng(11.5621224, 104.9161445), const [], const []));

  Completer<GoogleMapController> get controller => _controller;
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  final Set<Circle> _circle = {
    Circle(
      circleId: const CircleId('voatPhnom'),
      center: const LatLng(11.561462379276703, 104.9137589937964),
      radius: 100,
      fillColor: Colors.blue.withOpacity(0.5),
      strokeWidth: 1,
      strokeColor: Colors.blue,
    ),
  };

  Future<void> getCurrentLocation(BuildContext context) async {
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
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text('Location Permission'),
              content: Text('Please enable location permission in your settings'),
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
    }
    final position = await Geolocator.getCurrentPosition();
    await getPlaceMarkFromCoordinates(position.latitude, position.longitude).then((placeMarks) {
      emit(
        LocationState(
          LatLng(position.latitude, position.longitude),
          placeMarks,
          state.myMarker,
        ),
      );
    });
  }

  Future<void> getOnTapData(LatLng latLng,) async {
    final myMarker = state.myMarker;
    myMarker!.add(
      Marker(
        markerId: const MarkerId('1'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: LatLng(latLng.latitude, latLng.longitude),
        infoWindow: const InfoWindow(
          title: 'this is my new location',
          snippet: 'This is your location',
        ),
      ),
    );
    final newCameraPosition = CameraPosition(
      target: LatLng(latLng.latitude, latLng.longitude),
      zoom: 15,
    );

    await _controller.future.then((controller) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(newCameraPosition),
      );
    }).then((value) => _controller.isCompleted);

    await getPlaceMarkFromCoordinates(latLng.latitude, latLng.longitude).then((placeMark) {
      emit(
        LocationState(
          latLng,
          placeMark,
          myMarker,
        ),
      );
    });

  }

  Future<void> getDataWhenCameraMove(
      CameraPosition cameraPosition, List<Marker> myMarker,) async {
    myMarker.add(
      Marker(
        markerId: const MarkerId('1'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: LatLng(
          cameraPosition.target.latitude,
          cameraPosition.target.longitude,
        ),
        infoWindow: const InfoWindow(
          title: 'this is my new location',
          snippet: 'This is your location',
        ),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 500));

    await  getPlaceMarkFromCoordinates(cameraPosition.target.latitude, cameraPosition.target.longitude).then((placeMark) {
      emit(
        LocationState(
          cameraPosition.target,
          placeMark,
          myMarker,
        ),
      );
    });
  }


  // on Idle Camera

  // Future<void> onIdleCamera(
  //   CameraPosition cameraPosition,
  //   List<Marker> myMarker,
  //   List<Placemark> placeMark,
  // ) async {
  //   myMarker.add(
  //     Marker(
  //       markerId: const MarkerId('1'),
  //       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  //       position: LatLng(
  //         cameraPosition.target.latitude,
  //         cameraPosition.target.longitude,
  //       ),
  //       infoWindow: const InfoWindow(
  //         title: 'this is my new location',
  //         snippet: 'This is your location',
  //       ),
  //     ),
  //   );
  //   // I want location to change slowly not too fast
  //   await _controller.future.then((controller) {
  //     controller.animateCamera(
  //       CameraUpdate.newCameraPosition(cameraPosition),
  //     );
  //   });
  //
  //   emit(
  //     LocationState(
  //       cameraPosition.target,
  //       placeMark,
  //       myMarker,
  //     ),
  //   );
  // }

  Future<List<Placemark>> getPlaceMarkFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    final placeMarks = await placemarkFromCoordinates(
      latitude,
      longitude,
    );
    return placeMarks;
  }

  String getLocationAddress(
    List<Placemark>? placeMarks,
  ) {
    final address = state.placemarks!;

    final addresses =
        '${address.first.name}, ${address.first.subLocality}, ${address.first.locality}';
    print(addresses);
    return placeMarks!.isNotEmpty ? addresses : 'No Address';
  }

  Future<void> load() async {}
}
