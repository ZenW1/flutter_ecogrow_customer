import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit()
      : super(const LocationState(LatLng(11.5621224, 104.9161445), []));
  Position? position;
  List<Placemark> placemarks = [];
  List<Marker> myMarker = [];

  String get locationAddress =>
      placemarks.isNotEmpty ? placemarks[0].country! : 'No Address';

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

  Future<void> getCurrentLocation() async {
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
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.',);
      }
    }
    position = await Geolocator.getCurrentPosition();
    placemarks =
        await placemarkFromCoordinates(position!.latitude, position!.longitude);
    emit(LocationState(
        LatLng(position!.latitude, position!.longitude), placemarks,),);
  }

  Future<void> getOnTapData() async {
    position = await Geolocator.getCurrentPosition();
    myMarker.add(
      Marker(
        markerId: const MarkerId('newLocation'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: LatLng(position!.latitude, position!.longitude),
        infoWindow: const InfoWindow(
          title: 'this is my new location',
          snippet: 'This is your location',
        ),
      ),
    );
    final newCameraPosition = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 13,
    );
    final controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        newCameraPosition,
      ),
    );
    emit(LocationState(
        LatLng(position!.latitude, position!.longitude), placemarks,),);
  }

  Future<void> load() async {}
}
