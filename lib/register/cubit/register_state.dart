part of 'register_cubit.dart';

class RegisterState extends Equatable {
  const RegisterState(this.image, this.base64Image);
  final File? image;
  final String? base64Image;

  @override
  List<Object> get props => [image!, base64Image!];
}

class RegisterInitial extends RegisterState {
  const RegisterInitial() : super(null, '');
  @override
  List<Object> get props => [];
}
