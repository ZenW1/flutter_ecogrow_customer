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

      emit(LoginState()
          .copyWith(status: LoginStatus.sendOtp, phoneNumber: phoneNumber));
    } catch (e) {
      emit(state.copyWith(
          status: LoginStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> verifyOtp(String code) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final isNewUser = await _loginService.verifyOtp(
        codeSms: code,
      );
      final accessToken = await _loginService.getAccessToken();

      if (isNewUser) {
        print('isNewUser: $isNewUser');
        print('IsNewUser : $accessToken');
        emit(state.copyWith(status: LoginStatus.verifyOtp, isNewUser: isNewUser,accessToken: accessToken));
        return;
      } else if (!isNewUser) {
        print('isNewUser: $isNewUser');
        print('IsNewUser : $accessToken');
        emit(
          state.copyWith(
            status: LoginStatus.verifyOtp,
            isNewUser: isNewUser,
            accessToken: accessToken,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: e.toString()));
    }
  }
  //
  // Future<String> getAccessToken() async {
  //   try {
  //     return accessToken;
  //   } catch (e) {
  //     throw Exception('Error from token $e');
  //   }
  // }

  Future<void> timeOut() async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await _loginService.timeOut();
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: 'Time out'));
    } catch (e) {
      emit(state.copyWith(
          status: LoginStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> signOut() async {
    emit(state.copyWith(status: LoginStatus.loading));
    try{
      await _loginService.signOut();
      emit(state.copyWith(status: LoginStatus.loginOut));
    } catch (e){
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: e.toString()));
    }
  }
}
