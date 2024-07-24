import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_dialog.dart';
import 'package:image_picker/image_picker.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterInitial());

  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(
        source: source,
        imageQuality: 40,
      );
      if (image == null) return;
      final imageTemp = File(image.path);

      final validImage = ['jpg', 'png', 'jpeg'].contains(
        imageTemp.path.split('.').last,
      );
      if (!validImage) {
        await CustomDialog.showErrorDialog('Invalid image format');
      }
      emit(RegisterState(imageTemp));
    } on PlatformException catch (e) {
      await CustomDialog.showErrorDialog(e.message);
    } catch (e) {
      await CustomDialog.showErrorDialog(e.toString());
    }
  }

  // Widget displayProfileWidget() {
  //   return state.image == null
  //       ? InkWell(
  //           onTap: () {
  //             getImage(ImageSource.gallery);
  //           },
  //           child: const CircleAvatar(
  //             radius: 50,
  //             foregroundImage: NetworkImage(
  //               'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
  //             ),
  //           ),
  //         )
  //       : InkWell(
  //           onTap: () => getImage(ImageSource.gallery),
  //           child: CircleAvatar(
  //             radius: 50,
  //             foregroundImage: FileImage(state.image!),
  //           ),
  //         );
  // }
}
