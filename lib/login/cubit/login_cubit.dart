import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ecogrow_customer/data/service/login_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState(status: LoginStatus.initial));
  final LoginService _loginService = LoginService();

  late TextEditingController numberController = TextEditingController();

  Future<void> sendLoginOtp({required String phoneNumber}) async {
    emit(
      state.copyWith(status: LoginStatus.loading),
    );
    try {
      await _loginService.sendOtp(
        phoneNumber: '+855 ${phoneNumber}',
      );

      emit(LoginState().copyWith(status: LoginStatus.sendOtp, phoneNumber: phoneNumber));
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> verifyOtp(String code) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final isNewUser = await _loginService.verifyOtp(
        codeSms: code,
      );
      emit(state.copyWith(status: LoginStatus.verifyOtp, isNewUser: isNewUser));
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: e.toString()));
    }
  }
  //
  Future<String> getAccessToken() async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final accessToken = await _loginService.getAccessToken();
      return accessToken;
    } catch (e) {
      throw e;
    }
  }

  Future<void> timeOut() async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await _loginService.timeOut();
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: 'Time out'));
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: e.toString()));
    }
  }

}
