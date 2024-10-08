import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_dialog.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'current_address_event.dart';

part 'current_address_state.dart';

class CurrentAddressBloc
    extends Bloc<CurrentAddressEvent, CurrentAddressState> {
  CurrentAddressBloc() : super(CurrentAddressInitial(null, null)) {
    on<CurrentAddressEvent>(_getCurrentLocation);
    // on<CurrentLocationChangeEvent>();
    on<OnMoveCameraEvent>(_onCameraMoving);
    on<OnCameraStoppedEvent>(_onCameraStoppedMoving);
  }

  final TextEditingController addressController = TextEditingController();

  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();
  Future<void> _getCurrentLocation(
      CurrentAddressEvent event, Emitter<CurrentAddressState> emit) async {
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
        position,
        await getPlaceMarkFromCoordinates(
            position.latitude, position.longitude),
      ),
    );
    // await getPlaceMark(position: position);
    // await getCurrentAddressLocation(
    //     lat: position.latitude, lng: position.longitude);
  }

  Future<String> getCurrentAddressLocation(
      {required double lat, required double lng}) async {
    final placeMark = await placemarkFromCoordinates(lat, lng);
    final address = placeMark;

    final addresses =
        '${address.first.name} ${address.first.subLocality}, ${address.first.locality}';

    return addresses.isNotEmpty ? addresses : 'No Address';
  }

  Future<void> _onCameraMoving(
      OnMoveCameraEvent event, Emitter<CurrentAddressState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500));
    await controller.future.then((controller) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(event.cameraPosition!),
      );
    });
  }

  Future<void> _onCameraStoppedMoving(
      OnCameraStoppedEvent event, Emitter<CurrentAddressState> emit) async {
    controller.isCompleted;
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

  @override
  Future<void> close() {
    controller.future.then((value) => value.dispose());
    return super.close();
  }
}
