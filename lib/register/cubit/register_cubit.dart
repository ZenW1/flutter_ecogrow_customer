import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  TextEditingController  userNameController = TextEditingController();
  TextEditingController  phoneNumber = TextEditingController();
  TextEditingController  emailController = TextEditingController();

}
