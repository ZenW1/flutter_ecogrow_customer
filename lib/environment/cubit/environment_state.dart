part of 'environment_cubit.dart';

enum EnvironmentStatus { initial, loading, loaded, failure }

class EnvironmentState extends Equatable {
  const EnvironmentState({
    this.environment,
    this.message,
    this.environmentStatus = EnvironmentStatus.initial,
  });

  final EnvironmentModel? environment;
  final String? message;
  final EnvironmentStatus environmentStatus;

  EnvironmentState copyWith({
    EnvironmentModel? environment,
    String? message,
    EnvironmentStatus? environmentStatus,
  }) {
    return EnvironmentState(
      environment: environment ?? this.environment,
      message: message ?? message,
      environmentStatus: environmentStatus ?? this.environmentStatus,
    );
  }

  @override
  List<Object?> get props => [environment, message, environmentStatus];
}
