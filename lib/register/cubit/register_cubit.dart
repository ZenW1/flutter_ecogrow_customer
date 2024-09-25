import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecogrow_customer/data/model/user_info_model.dart';
import 'package:flutter_ecogrow_customer/data/repo/authentication_repo.dart';
import 'package:flutter_ecogrow_customer/data/service/login_service.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_token.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_dialog.dart';
import 'package:image_picker/image_picker.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authenticationRepo, this._appToken) : super(RegisterInitial());

  AuthenticationRepo _authenticationRepo;
  AppToken _appToken;
  final LoginService _loginService = LoginService();

  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  // File? image;
  // String? base64Image;

  Future<void> registerUser({
    required String firstName,
    required String lastName,
    required String gender,
    required String phoneNumber,
    required String dob,
    required String image,
  }) async {
      emit(RegisterInitial());
      final data = await _authenticationRepo.registerUser(
        firstName: firstName,
        lastName: lastName,
        uid: '${_appToken.getUid()}',
        phoneNumber: phoneNumber,
        image: image,
        gender: gender,
        dob: dob,
      );

      log('data: ${data.data!.toJson()}');

      print('uid ${_appToken.getUid()}');

      Future.wait([
        _appToken.saveAccessToken(await _loginService.getAccessToken()),
        _appToken.setUser(data.data!),
      ]);

      emit(RegisterLoaded(data, data.message!));

  }

  Future<void> getImageAndConvertToBase64(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(
        source: source,
        imageQuality: 5,
      );

      if (image == null) return;
      final imageTemp = File(image.path);

      final validImage = ['jpg', 'png', 'jpeg'].contains(
        imageTemp.path.split('.').last,
      );
      if (!validImage) {
        await CustomDialog.showErrorDialog('Invalid image format');
      }

      emit(RegisterState(
        imageTemp,
      ));
    } on PlatformException catch (e) {
      await CustomDialog.showErrorDialog(e.message);
    } catch (e) {
      await CustomDialog.showErrorDialog(e.toString());
    }
  }

//
}
