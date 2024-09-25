import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecogrow_customer/data/model/address_model.dart';
import 'package:flutter_ecogrow_customer/data/repo/address_repo.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit(this.repo) : super(AddressInitial());

  final AddressRepo repo;

  Future<void> init() async {
    emit(AddressInitial());
    try {
      final response = await repo.getAddress();
      emit(AddressLoaded(data: response));
    } catch (e) {
      emit(AddressFailed(message: e.toString()));
    }
  }
}
