import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ecogrow_customer/data/service/login_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial());
  final LoginService _loginService = LoginService();

  late TextEditingController numberController = TextEditingController();

  Future<void> sendLoginOtp() async {
    emit(const LoginLoading());
    try {
      final phoneNumber = '+855 ${numberController.text}';
       await _loginService.sendOtp(
        phoneNumber: phoneNumber,
      );
      emit(LoginSendingOtp(phoneNumber));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<void> verifyOtp(String code) async {
    emit(const LoginInitial());
    try {
      final isNewUser = await _loginService.verifyOtp(codeSms: code);
      emit(LoginVerifyOtp(isNewUser: isNewUser));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
