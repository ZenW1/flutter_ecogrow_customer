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

  final AddressResponseModel data;

  @override
  List<Object> get props => [data];
}

class AddressDelete extends AddressState {
  final String message;
  AddressDelete({required this.message});
  @override
  List<Object> get props => [message];
}

class AddressFailed extends AddressState {
  final String message;

  AddressFailed({required this.message});

  @override
  List<Object> get props => [message];
}
