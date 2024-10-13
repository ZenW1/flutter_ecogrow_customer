import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecogrow_customer/data/model/address_model.dart';
import 'package:flutter_ecogrow_customer/data/repo/address_repo.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit(this.repo) : super(AddressInitial());

  final AddressRepo repo;

  int selectedAddress = 0;

  Future<void> init() async {
    emit(AddressInitial());
    try {
      final response = await repo.getAddress();
      emit(AddressLoaded(data: response));
    } catch (e) {
      emit(AddressFailed(message: e.toString()));
    }
  }

  Future<void> saveAddress({
    required String latitude,
    required String longitude,
    required String title,
    required String address,
    required String description,
  }) async {
    emit(AddressInitial());
    try {
      final response = await repo.saveAddress(
        latitude: latitude,
        longitude: longitude,
        title: title,
        address: address,
        description: description,
      );
      emit(AddressLoaded(data: response));
    } catch (e) {
      emit(AddressFailed(message: e.toString()));
    }
  }


  Future<void> updateAddress({
    required String id,
    required String latitude,
    required String longitude,
    required String title,
    required String address,
    required String description,
    required String isDefault,
  }) async {
    emit(AddressInitial());
    try {
      await repo.updateAddress(
        id: id,
        latitude: latitude,
        longitude: longitude,
        title: title,
        address: address,
        description: description,
        isDefault: isDefault,
      );
      emit(AddressSuccess(message: 'Address updated successfully'));
    } catch (e) {
      emit(AddressFailed(message: e.toString()));
    }
  }


  Future<void> deleteAddresss({
    required String id,
  }) async {
    emit(AddressInitial());
    try {
      await repo.deleteAddress(id: id);
      emit(AddressDelete(message: 'Address deleted successfully'));
    } catch (e) {
      emit(AddressFailed(message: e.toString()));
    }
  }

  // set default
  Future<void> setDefaultAddress({
    required int id,
  }) async {
    selectedAddress = id;
  }
}
