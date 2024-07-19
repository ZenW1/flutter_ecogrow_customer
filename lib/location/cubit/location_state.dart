part of 'location_cubit.dart';

class LocationState extends Equatable {

  final LatLng location;
  final List<Placemark> locationAddress;
  const LocationState(this.location, this.locationAddress);

  @override
  List<Object> get props => [location,locationAddress];
}

class LocationSelector extends LocationState {
  const LocationSelector(super.location, super.locationAddress);
}


