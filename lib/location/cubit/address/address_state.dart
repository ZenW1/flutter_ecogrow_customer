part of 'address_cubit.dart';

sealed class AddressState extends Equatable {
  const AddressState();
}

final class AddressInitial extends AddressState {
  @override
  List<Object> get props => [];
}

class AddressLoaded extends AddressState {
  AddressLoaded({required this.data});

  final AddressModel data;

  @override
  List<Object> get props => [data];
}

class AddressFailed extends AddressState {
  final String message;

  AddressFailed({required this.message});

  @override
  List<Object> get props => [message];
}
