import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_dialog.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'current_address_event.dart';

part 'current_address_state.dart';

class CurrentAddressBloc
    extends Bloc<CurrentAddressEvent, CurrentAddressState> {
  CurrentAddressBloc() : super(CurrentAddressInitial()) {
    on<CurrentAddressEvent>(_getCurrentLocation);
    on<OnMoveCameraEvent>(_onCameraMoving);
    on<OnCameraStoppedEvent>(_onCameraStoppedMoving);
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Future<void> _getCurrentLocation(
      CurrentAddressEvent event, Emitter<CurrentAddressState> emit) async {
    emit(CurrentAddressInitial());
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
    emit(
      CurrentAddressLoaded(
        position: position,
        controller: await _controller,
        placeMarks: await getPlaceMarkFromCoordinates(
            position.latitude, position.longitude),
      ),
    );
    await getPlaceMark(position: position);
    await getCurrentAddressLocation(
        lat: position.latitude, lng: position.longitude);
  }

  Future<String> getCurrentAddressLocation(
      {required double lat, required double lng}) async {
    final placeMark = await placemarkFromCoordinates(lat, lng);
    final address = placeMark;

    final addresses =
        '${address.first.name} ${address.first.subLocality}, ${address.first.locality}';

    // translate the address to the user language
    // final addresses = '${address.first.name} ${address.first.subLocality}, ${address.first.locality}';
    //  translate the address
    //  final addresses = '${address.first.name} ${address.first.subLocality}, ${address.first.locality}';

    return addresses.isNotEmpty ? addresses : 'No Address';
  }

  Future<void> getPlaceMark({required Position position}) async {
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
        .then((placeMarks) {});
  }

  // Future<void> onCameraStoppedMoving() async {
  //   await Future.delayed(const Duration(milliseconds: 500));
  //
  //   await getPlaceMarkFromCoordinates(state.location!.latitude, state.location!.longitude).then((placeMark) {
  //     emit(
  //       state.copyWith(
  //         status: LocationStatus.loaded,
  //         location: state.location,
  //         placemarks: placeMark,
  //         myMarker: state.myMarker,
  //       ),
  //     );
  //   });
  // }

  // Future<void> onCameraStarted(LatLng latLng,) async {
  //
  //   await _controller.future.then((controller) {
  //     controller.animateCamera(
  //       CameraUpdate.newCameraPosition(newCameraPosition),
  //     );
  //   }).then((value) => _controller.isCompleted);
  // }

  Future<void> _onCameraMoving(
      OnMoveCameraEvent event, Emitter<CurrentAddressState> emit) async {
    await _controller.future.then((controller) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(event.cameraPosition!),
      );
    }).then((value) => _controller.isCompleted);
    emit(CurrentLatLng(
        lat: event.cameraPosition!.target.latitude,
        lng: event.cameraPosition!.target.longitude));
  }

  Future<void> _onCameraStoppedMoving(
      OnCameraStoppedEvent event, Emitter<CurrentAddressState> emit) async {
    if (_controller.isCompleted) {
      await Future.delayed(const Duration(milliseconds: 500));
      emit(CurrentAddressLoaded(
          position: event.position,
          controller: await _controller,
          placeMarks: await getPlaceMarkFromCoordinates(
              event.position.latitude, event.position.longitude)));
    }
  }

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
}
