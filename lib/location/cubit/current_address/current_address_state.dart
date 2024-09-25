part of 'current_address_bloc.dart';

sealed class CurrentAddressState extends Equatable {
  const CurrentAddressState();
}

final class CurrentAddressInitial extends CurrentAddressState {
  @override
  List<Object> get props => [];
}

class CurrentAddressLoaded extends CurrentAddressState {
  CurrentAddressLoaded(
      {required this.position, this.placeMarks, this.controller});

  final Position position;
  final List<Placemark>? placeMarks;
  final Completer<GoogleMapController>? controller;

  @override
  List<Object> get props => [position, placeMarks!, controller!];
}

class CurrentLatLng extends CurrentAddressState {
  CurrentLatLng({required this.lat, required this.lng});

  final double lat;
  final double lng;

  @override
  List<Object> get props => [lat, lng];
}
