part of 'location_cubit.dart';

enum LocationStatus {
  initial,
  loading,
  loaded,
  error,
}

class LocationState extends Equatable {
  LocationState({
    this.message = '',
    this.location = const LatLng(11.5689, 104.8903),
    this.placemarks = const [],
    this.myMarker = const  Marker(
      markerId:  MarkerId('1'),
      position: LatLng(11.5689, 104.8903),
      infoWindow: const InfoWindow(
        title: 'this is my new location',
        snippet: 'This is your location',
      ),
    ),
    this.status = LocationStatus.initial,
  });

  factory LocationState.initial() {
    // wat phnom
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

  final String message;
  final LatLng? location;
  final List<Placemark> placemarks;
  final LocationStatus status;
  final Marker? myMarker;

  @override
  List<Object?> get props => [message, location, placemarks, status];
}
