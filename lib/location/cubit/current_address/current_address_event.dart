part of 'current_address_bloc.dart';

sealed class CurrentAddressEvent extends Equatable {
  const CurrentAddressEvent();
}

class CurrentAddressInit extends CurrentAddressEvent {
  @override
  List<Object> get props => [];
}

class CurrentLocationChangeEvent extends CurrentAddressEvent {
  final double? lat;
  final double? lng;
  CurrentLocationChangeEvent(this.lat, this.lng);

  @override
  List<Object?> get props => [lat, lng];
}

class OnMoveCameraEvent extends CurrentAddressEvent {
  final CameraPosition? cameraPosition;
  OnMoveCameraEvent(this.cameraPosition);

  @override
  List<Object?> get props => [cameraPosition];
}

class OnCameraStoppedEvent extends CurrentAddressEvent {
  final Position position;
  final List<Placemark>? placeMarks;
  OnCameraStoppedEvent(this.position, this.placeMarks);
  @override
  List<Object> get props => [position, placeMarks!];
}
