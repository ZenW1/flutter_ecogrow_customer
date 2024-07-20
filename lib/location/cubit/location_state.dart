part of 'location_cubit.dart';

class LocationState extends Equatable {
  const LocationState(this.location, this.locationAddress);
  final LatLng location;
  final List<Placemark> locationAddress;

  @override
  List<Object> get props => [location, locationAddress];
}

class LocationSelector extends LocationState {
  const LocationSelector(super.location, super.locationAddress);
}
