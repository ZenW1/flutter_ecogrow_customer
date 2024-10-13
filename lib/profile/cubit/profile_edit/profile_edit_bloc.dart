import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecogrow_customer/data/model/register_model.dart';
import 'package:flutter_ecogrow_customer/data/model/user_info_model.dart';
import 'package:flutter_ecogrow_customer/data/model/user_update_response_model.dart';
import 'package:flutter_ecogrow_customer/data/repo/authentication_repo.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_dialog.dart';
import 'package:image_picker/image_picker.dart';

import '../../../shared/constant/app_token.dart';

part 'profile_edit_event.dart';

part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final AuthenticationRepo _authenticationRepo;
  final AppToken _appToken;

  ProfileEditBloc(this._authenticationRepo, this._appToken) : super(ProfileEditInitial()) {
    on<ProfileOnEditEvent>(_onEditProfile);
    on<ProfileEditUploadImageEvent>(_onUploadImage);
  }

  late TextEditingController firstNameController = TextEditingController();
  late TextEditingController lastNameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController addressController = TextEditingController();
  late TextEditingController dobController = TextEditingController();
  late String imageUrl = '';
  late File? imageFile = File('');
  late String? base64Image;

  File get imageFileUpdate => imageFile!;

  Future<void> _onEditProfile(ProfileOnEditEvent event, Emitter<ProfileEditState> emit) async {
    emit(ProfileEditLoading());
    try {
      final user = await _appToken.getUser();
      final userId = user.id;
      final res = await _authenticationRepo.editProfile(
        firstName: event.firstName,
        lastName: event.lastName,
        dob: event.dob,
        gender: event.gender,
        phoneNumber: event.phoneNumber,
        uid: userId!,
        image: event.image,
      );
      await _appToken.setUser(UserModel(
        id: res.data!.id,
        firstName: res.data!.firstName,
        lastName: res.data!.lastName,
        dob: res.data!.dob,
        gender: res.data!.gender,
        phoneNumber: res.data!.phoneNumber,
        image: res.data!.image!,
        createdAt: res.data!.createdAt,
        updatedAt: res.data!.updatedAt,
      ));
      emit(ProfileEditLoadSuccess(res, 'Profile updated successfully'));
    } on TypeError catch (e) {
      emit(ProfileEditFailure(e.toString()));
    } on Exception catch (e) {
      emit(ProfileEditFailure(e.toString()));
    }
  }

  Future<void> _onUploadImage(ProfileEditUploadImageEvent event, Emitter<ProfileEditState> emit) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: event.source, imageQuality: 40);
      if (pickedFile == null) return;
      final imageTemp = File(pickedFile.path);

      final validImage = ['jpg', 'png', 'jpeg'].contains(
        imageTemp.path.split('.').last,
      );
      if (!validImage) {
        await CustomDialog.showErrorDialog('Invalid image format');
      }

      final bytes = await imageTemp.readAsBytes();
      base64Image = base64Encode(bytes);
      imageFile = imageTemp;
      emit(ProfileEditUploadImage(imageTemp, base64Image!));
    } on PlatformException catch (e) {
      await CustomDialog.showErrorDialog(e.message);
    } catch (e) {
      await CustomDialog.showErrorDialog(e.toString());
    }
  }
}
