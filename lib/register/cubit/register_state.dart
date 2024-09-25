part of 'register_cubit.dart';

enum RegisterStatus { initial, loading, success, failed, uploadImage }


class RegisterState extends Equatable {
  const RegisterState(this.image,);

  final File? image;

  @override
  List<Object> get props => [image!];
}


class RegisterInitial extends RegisterState {
  const RegisterInitial() : super(null);
  @override
  List<Object> get props => [];
}

class RegisterLoaded extends RegisterState {
  const RegisterLoaded(
    this.data,
    this.message,
  ) : super(null);

  final RegisterUserModel data;
  final String message;

  @override
  List<Object> get props => [data, message];
}

class RegisterFailed extends RegisterState {
  const RegisterFailed(this.message) : super(null);

  final String message;

  @override
  List<Object> get props => [message];
}
