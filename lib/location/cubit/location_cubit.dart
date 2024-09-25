import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_dialog.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationState(status: LocationStatus.initial));

  Completer<GoogleMapController> get controller => _controller;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

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

  Future<Position> getCurrentLocation() async {
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
              'Location permissions are permanently denied, we cannot request permissions., Open Settings, Cancel'),
        );
      }
    }

    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  Future<void> getPlaceMark() async {
    emit(state.copyWith(status: LocationStatus.loading));
    final position = await getCurrentLocation();
    // mymartker
    final myMarker = Marker(
      markerId: const MarkerId('1'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: LatLng(position.latitude, position.longitude),
      infoWindow: const InfoWindow(
        title: 'this is my new location',
        snippet: 'This is your location',
      ),
    );
    await getPlaceMarkFromCoordinates(position.latitude, position.longitude)
        .then((placeMarks) {
      emit(
        state.copyWith(
          status: LocationStatus.loaded,
          location: LatLng(position.latitude, position.longitude),
          placemarks: placeMarks,
          myMarker: myMarker,
        ),
      );
    });
  }

  Future<void> onCameraStarted(
    LatLng latLng,
  ) async {
    emit(state.copyWith(status: LocationStatus.loading));
    Marker myMarker;
    myMarker = Marker(
      markerId: const MarkerId('1'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: LatLng(latLng.latitude, latLng.longitude),
      infoWindow: const InfoWindow(
        title: 'this is my new location',
        snippet: 'This is your location',
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

    await getPlaceMarkFromCoordinates(latLng.latitude, latLng.longitude)
        .then((placeMark) {
      emit(
        state.copyWith(
          status: LocationStatus.loaded,
          location: latLng,
          placemarks: placeMark,
          myMarker: myMarker,
        ),
      );
    });
  }

  Future<void> onCameraStoppedMoving() async {
    await Future.delayed(const Duration(milliseconds: 500));

    await getPlaceMarkFromCoordinates(
            state.location!.latitude, state.location!.longitude)
        .then((placeMark) {
      emit(
        state.copyWith(
          status: LocationStatus.loaded,
          location: state.location,
          placemarks: placeMark,
          myMarker: state.myMarker,
        ),
      );
    });
  }

  Future<Marker> getDataWhenCameraMove(
    CameraPosition cameraPosition,
  ) async {
    Marker myMarker;
    myMarker = Marker(
      markerId: const MarkerId('1'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      draggable: true,
      position: LatLng(
        cameraPosition.target.latitude,
        cameraPosition.target.longitude,
      ),
      onDrag: (value) {
        emit(
          state.copyWith(
            status: LocationStatus.loaded,
            location: LatLng(value.latitude, value.longitude),
            placemarks: state.placemarks,
          ),
        );
      },
      onDragEnd: (value) {
        emit(
          state.copyWith(
            status: LocationStatus.loaded,
            location: LatLng(value.latitude, value.longitude),
            placemarks: state.placemarks,
          ),
        );
      },
      onDragStart: (value) {
        emit(
          state.copyWith(
            status: LocationStatus.loaded,
            location: LatLng(value.latitude, value.longitude),
            placemarks: state.placemarks,
          ),
        );
      },
      infoWindow: const InfoWindow(
        title: 'this is my new location',
        snippet: 'This is your location',
      ),
    );
    return myMarker;
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

  String getLocationAddress() {
    final address = state.placemarks;

    final addresses =
        '${address!.first.name} ${address.first.subLocality}, ${address.first.locality}';

    // translate the address to the user language
    // final addresses = '${address.first.name} ${address.first.subLocality}, ${address.first.locality}';
    //  translate the address
    //  final addresses = '${address.first.name} ${address.first.subLocality}, ${address.first.locality}';

    emit(
      state.copyWith(
        status: LocationStatus.loaded,
        placemarks: address,
        location: state.location,
      ),
    );

    return addresses.isNotEmpty ? addresses : 'No Address';
  }

  Future<void> load() async {}

  Future<void> getOnTapData(
    LatLng latLng,
  ) async {
    List<Marker> myMarker = [];
    myMarker.add(
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

    // await getPlaceMarkFromCoordinates(latLng.latitude, latLng.longitude).then((placeMark) {
    //   emit(
    //     state.copyWith(
    //       latLng,
    //       placeMark,
    //       myMarker,
    //     ),
    //   );
    // });
  }

// initState
}
