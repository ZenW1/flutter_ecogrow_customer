import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/data/model/register_model.dart';
import 'package:flutter_ecogrow_customer/data/model/user_info_model.dart';
import 'package:flutter_ecogrow_customer/data/repo/authentication_repo.dart';
import 'package:flutter_ecogrow_customer/data/service/login_service.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_token.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepo, this._appToken)
      : super(LoginState(status: LoginStatus.initial, userInfo: UserInfoModel()));
  final LoginService _loginService = LoginService();
  final AuthenticationRepo _authenticationRepo;
  final AppToken _appToken;

  late TextEditingController numberController = TextEditingController();

  Future<void> sendLoginOtp({required String phoneNumber}) async {
    emit(
      state.copyWith(status: LoginStatus.loading),
    );
    try {
      await _loginService.sendOtp(
        phoneNumber: '+855 ${phoneNumber}',
      );
      emit(state.copyWith(status: LoginStatus.sendOtp, phoneNumber: phoneNumber));
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> login() async {

    emit(state.copyWith(status: LoginStatus.loading));

    try {

      final accessToken = await _loginService.getAccessToken(forceReFresh: true);
      _appToken.saveAccessToken(accessToken);



    final response = await _authenticationRepo.login(token: accessToken);

      log('login response : $response');

      Future.wait(
        [
          _appToken.setUser(response.customerProfile!),
        ],
      );
      emit(state.copyWith(
          status: LoginStatus.success,
          userInfo: response,
          accessToken: accessToken,
          isRegister: response.isRegister!,));
    } catch (e) {
      await _appToken.deleteToken();
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: '${e.toString()}'));
    }
  }

  Future<void> verifyOtp(String code) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final uid = await _loginService.verifyOtp(
        codeSms: code,
      );

      print('uid: $uid');

      _appToken.setUid(uid);

      emit(
        state.copyWith(
          status: LoginStatus.verifyOtp,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: e.toString()));
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

  Future<void> signOut() async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      Future.wait([
        _loginService.signOut(),
        _appToken.deleteToken(),
      ]);
      emit(state.copyWith(status: LoginStatus.loginOut));
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: e.toString()));
    }
  }
}
