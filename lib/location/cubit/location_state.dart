part of 'location_cubit.dart';

enum LocationStatus {
  initial,
  loading,
  loaded,
  error,
}

class LocationState extends Equatable {
  LocationState({
    this.message,
    this.location,
    this.placemarks,
    this.myMarker,
    this.status = LocationStatus.initial,
  });

  factory LocationState.initial() {
    return LocationState(
      location: const LatLng(11.5689, 104.8903),
    );
  }

  LocationState copyWith({
    String? message,
    LatLng? location,
    List<Placemark>? placemarks,
    Marker? myMarker,
    LocationStatus? status,
  }) {
    return LocationState(
      message: message ?? this.message,
      location: location ?? this.location,
      placemarks: placemarks ?? this.placemarks,
      status: status ?? this.status,
      myMarker: myMarker ?? this.myMarker,
    );
  }

  final String? message;
  final LatLng? location;
  final List<Placemark>? placemarks;
  final LocationStatus? status;
  final Marker? myMarker;

  @override
  List<Object?> get props => [message, location, placemarks, status];
}
