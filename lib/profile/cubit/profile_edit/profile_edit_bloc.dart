import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecogrow_customer/data/model/user_info_model.dart';
import 'package:flutter_ecogrow_customer/data/repo/authentication_repo.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_dialog.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_edit_event.dart';

part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final AuthenticationRepo _authenticationRepo;

  ProfileEditBloc(this._authenticationRepo) : super(ProfileEditInitial()) {
    on<ProfileOnEditEvent>(_onEditProfile);
    on<ProfileEditUploadImageEvent>(_onUploadImage);
  }

  late TextEditingController firstNameController = TextEditingController();
  late TextEditingController lastNameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController addressController = TextEditingController();
  late TextEditingController dobController = TextEditingController();
  late File? imageFile = File('');
  late String? base64Image;

  Future<void> _onEditProfile(ProfileOnEditEvent event, Emitter<ProfileEditState> emit) async {
    emit(ProfileEditLoading());
    await _authenticationRepo.editProfile(userData: event.userData).then((value) {
      emit(
        ProfileEditLoadSuccess(
          value,
          'Profile Updated Successfully',
        ),
      );
    }).catchError((e) {
      emit(ProfileEditFailure(e.toString()));
    });
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
      emit(ProfileEditUploadImage(imageTemp, base64Image!));
    } on PlatformException catch (e) {
      await CustomDialog.showErrorDialog(e.message);
    } catch (e) {
      await CustomDialog.showErrorDialog(e.toString());
    }
  }
}
