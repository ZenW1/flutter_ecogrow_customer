part of 'current_address_bloc.dart';

sealed class CurrentAddressState extends Equatable {
  const CurrentAddressState(this.position, this.placeMarks);

  final Position? position;
  final List<Placemark>? placeMarks;
}

final class CurrentAddressInitial extends CurrentAddressState {
  CurrentAddressInitial(super.position, super.placeMarks);

  @override
  List<Object> get props => [];
}

class CurrentAddressLoaded extends CurrentAddressState {
  CurrentAddressLoaded(super.position, super.placeMarks);

  @override
  List<Object> get props => [position!, placeMarks!];
}

// class CurrentLatLng extends CurrentAddressState {
//   CurrentLatLng({required this.lat, required this.lng});
//
//   final double lat;
//   final double lng;
//
//   @override
//   List<Object> get props => [lat, lng];
// }
