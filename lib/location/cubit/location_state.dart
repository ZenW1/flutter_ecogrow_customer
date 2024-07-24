part of 'location_cubit.dart';

class LocationState extends Equatable {
  LocationState(this.location, this.placemarks, this.myMarker);
  final LatLng? location;
  // final List<Placemark> locationAddress;
   late List<Placemark>? placemarks;
  late List<Marker>? myMarker;

  @override
  List<Object> get props => [location!, placemarks!, myMarker!];
}

class LocationSelector extends LocationState {
   LocationSelector(super.location, super.placemarks, super.myMarker);
}

