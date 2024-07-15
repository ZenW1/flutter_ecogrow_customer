import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/environment_model.dart';

part 'environment_state.dart';

class EnvironmentCubit extends Cubit<EnvironmentState> {
  EnvironmentCubit() : super(const EnvironmentState());

  void load(EnvironmentModel environment) {
    emit(state.copyWith(environmentStatus: EnvironmentStatus.loading));
    try {
      emit(
        state.copyWith(environment: environment, environmentStatus: EnvironmentStatus.loaded),
      );
    } catch (err) {
      emit(state.copyWith(message: '$err', environmentStatus: EnvironmentStatus.failure));
    }
  }
}
