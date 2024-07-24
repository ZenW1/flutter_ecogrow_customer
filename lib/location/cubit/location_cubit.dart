import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationState(LatLng(11.5621224, 104.9161445), [], []));

  List<Placemark> placeMarks = [];
  List<Marker> myMarker = [];

  String get locationAddress => state.placemarks!.isNotEmpty ? state.placemarks![0].country! : 'No Address';

  Completer<GoogleMapController> get controller => _controller;
  Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
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
    var position = await Geolocator.getCurrentPosition();
    var placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    emit(
      LocationState(
        LatLng(position!.latitude, position!.longitude),
        placemarks,
        state.myMarker,
      ),
    );
  }

  Future<void> getOnTapData(LatLng latLng) async {
    myMarker!.add(
      Marker(
        markerId: const MarkerId('1'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: LatLng(latLng!.latitude, latLng!.longitude),
        infoWindow: const InfoWindow(
          title: 'this is my new location',
          snippet: 'This is your location',
        ),
      ),
    );
    final newCameraPosition = CameraPosition(
      target: LatLng(latLng!.latitude, latLng!.longitude),
      zoom: 15,
    );

    await _controller.future.then((controller) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(newCameraPosition),
      );
    }).then((value) => _controller.isCompleted);
    emit(
      LocationState(
        latLng,
        placeMarks,
        myMarker,
      ),
    );
  }

  Future<void> getDataWhenCameraMove(CameraPosition cameraPosition) async {
    var placeMarks = await placemarkFromCoordinates(
      cameraPosition.target.latitude,
      cameraPosition.target.longitude,
    );
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
    await _controller.future.then((controller) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(cameraPosition),
      );
    });
    emit(
      LocationState(
        cameraPosition.target,
        placeMarks,
        myMarker,
      ),
    );
  }

   String getLocationAddress()  {
    var address = state.placemarks![0];


    var addresses =
        '${address.name}, ${address.subLocality}, ${address.locality}, ${address.administrativeArea} ${address.postalCode}, ${address.country}';
    return placeMarks.isNotEmpty ? addresses! : 'No Address';
  }

  Future<void> load() async {}
}
