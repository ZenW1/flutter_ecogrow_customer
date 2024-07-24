part of 'register_cubit.dart';

class RegisterState extends Equatable {
  const RegisterState(this.image);
  final File? image;

  @override
  List<Object> get props => [image!];
}

class RegisterInitial extends RegisterState {
  const RegisterInitial() : super(null);
  @override
  List<Object> get props => [];
}
