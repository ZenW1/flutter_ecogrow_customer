import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/data/model/register_model.dart';
import 'package:flutter_ecogrow_customer/data/model/user_info_model.dart';
import 'package:flutter_ecogrow_customer/main/main.dart';
import 'package:flutter_ecogrow_customer/profile/cubit/profile_cubit.dart';
import 'package:flutter_ecogrow_customer/profile/cubit/profile_edit/profile_edit_bloc.dart';
import 'package:flutter_ecogrow_customer/route/app_router.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_token.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_bar_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/global_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEditPage extends StatefulWidget {
  ProfileEditPage({required this.imageUrl, super.key});

  static const String routePath = '/profile/edit';

  final String imageUrl;

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileEditBloc, ProfileEditState>(
      listener: (context, state) {
        if (state is ProfileEditLoading) {
          context.loaderOverlay.show();
        } else if (state is ProfileEditLoadSuccess) {
          context.loaderOverlay.hide();

          // context.read<AppToken>().setUser(state.userData.customerProfile!);
          context.read<ProfileCubit>().fetchUserInfo();
          AppRouter.router.push(MainPage.routePath);
        } else if (state is ProfileEditFailure) {
          context.loaderOverlay.hide();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        } else if (state is ProfileEditUploadImage) {
          context.loaderOverlay.hide();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Image uploaded successfully'),
            ),
          );
        }
      },
      child: ProfileEditView(
        imageUrl: widget.imageUrl,
      ),
    );
  }
}

class ProfileEditView extends StatefulWidget {
  ProfileEditView({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  List<String> genderList = ['Male', 'Female'];

  String genderSelected = '';

  String get getGender {
    if (genderSelected == genderList[0]) {
      return 'M';
    } else {
      return 'F';
    }
  }

  final dateFormat = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileEditBloc, ProfileEditState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBarWidget(
            title: 'Edit Profile',
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      context.read<ProfileEditBloc>().add(ProfileEditUploadImageEvent(ImageSource.gallery));
                    },
                    child: state is ProfileEditUploadImage
                        ? CircleAvatar(
                            radius: 50,
                            backgroundImage: FileImage(state.image),
                          )
                        : Hero(
                            tag: 'profile',
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: Image.network(
                                widget.imageUrl,
                              ).image,
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const AppTitleWidget(text: 'First Name'),
                  const SizedBox(
                    height: 16,
                  ),
                  GlobalTextField(
                    textInputType: TextInputType.text,
                    controller: context.read<ProfileEditBloc>().firstNameController,
                    hintText: 'First Name',
                    labelText: 'First Name',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const AppTitleWidget(text: 'Last Name'),
                  const SizedBox(
                    height: 16,
                  ),
                  GlobalTextField(
                    textInputType: TextInputType.text,
                    controller: context.read<ProfileEditBloc>().lastNameController,
                    hintText: 'Last Name',
                    labelText: 'Last Name',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const AppTitleWidget(text: 'Gender'),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 50,
                    // padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButton<String>(
                      hint: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: genderSelected.isEmpty
                            ? const Text('Please Select Gender')
                            : Text(
                                genderSelected,
                                style: const TextStyle(
                                  color: AppColors.greyColor,
                                  fontSize: 12,
                                ),
                              ),
                      ),
                      borderRadius: BorderRadius.circular(25),
                      items: genderList.map(
                        (values) {
                          return DropdownMenuItem<String>(
                            enabled: true,
                            value: values,
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Text(
                                    values,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ).toList(),
                      isExpanded: true,
                      underline: Container(),
                      onChanged: (newValue) {
                        setState(() {
                          genderSelected = newValue!;
                        });
                      },
                      selectedItemBuilder: (BuildContext context) {
                        return genderList.map((value) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              value,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  const AppTitleWidget(text: 'Date Of Birth'),
                  const SizedBox(
                    height: 16,
                  ),
                  GlobalTextField(
                    textInputType: TextInputType.datetime,
                    controller: context.read<ProfileEditBloc>().dobController,
                    hintText: 'Date Of Birth',
                    labelText: 'Date Of Birth',
                    onTap: () {
                      final datePicker = showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      datePicker.then((value) {
                        if (value != null) {
                          // format the date yyyy-mm-dd
                          final formattedDate = '${value.year}-${value.month}-${value.day}';
                          context.read<ProfileEditBloc>().dobController.text = formattedDate;
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const AppTitleWidget(text: 'Phone Number'),
                  const SizedBox(
                    height: 16,
                  ),
                  GlobalTextField(
                    textInputType: TextInputType.number,
                    controller: context.read<ProfileEditBloc>().phoneController,
                    hintText: 'Input your phone number',
                    labelText: 'Phone number',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.fromLTRB(
              16,
              32,
              16,
              16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppButton.roundedSidedButton(
                    context,
                    color: AppColors.primary,
                    textColor: AppColors.primary,
                    onTap: () {},
                    text: 'Cancel',
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: AppButton.roundedFilledButton(
                    context,
                    backgroundColor: AppColors.primary,
                    onTap: () {
                      // final userModel = UserModel(
                      //   firstName: context.read<ProfileEditBloc>().firstNameController.text,
                      //   lastName: context.read<ProfileEditBloc>().lastNameController.text,
                      //   phoneNumber: context.read<ProfileEditBloc>().phoneController.text,
                      //   dob: dateFormat.parse(context.read<ProfileEditBloc>().dobController.text),
                      //   image: widget.imageUrl,
                      //   id: int.tryParse(context.read<AppToken>().getUid().toString()),
                      // );
                      //
                      // print('userModel ${userModel.toJson()}');
                      // print('userModel ${userModel.toJson()}');

                      print('image ${context.read<ProfileEditBloc>().imageFileUpdate}');
                      // log('image base64 ${ImageConstants.constants.convertToBase64(context.read<ProfileEditBloc>().imageFileUpdate)}');
                      print('uid ${context.read<AppToken>().getUid()}');
                      print('gender ${getGender}');
                      print('image url ${widget.imageUrl}');
                      print('dob ${context.read<ProfileEditBloc>().dobController.text}');
                      print('phone ${context.read<ProfileEditBloc>().phoneController.text}');

                      if (context.read<ProfileEditBloc>().imageFile!.path != '') {
                        context.read<ProfileEditBloc>().add(
                              ProfileOnEditEvent(
                                firstName: context.read<ProfileEditBloc>().firstNameController.text,
                                lastName: context.read<ProfileEditBloc>().lastNameController.text,
                                gender: getGender,
                                dob: context.read<ProfileEditBloc>().dobController.text,
                                phoneNumber: context.read<ProfileEditBloc>().phoneController.text,
                                uid: int.tryParse(context.read<AppToken>().getUid().toString()) ?? 0,
                                image: widget.imageUrl,
                              ),
                            );
                      } else {
                        ProfileOnEditEvent(
                          firstName: context.read<ProfileEditBloc>().firstNameController.text,
                          lastName: context.read<ProfileEditBloc>().lastNameController.text,
                          gender: getGender,
                          dob: context.read<ProfileEditBloc>().dobController.text,
                          phoneNumber: context.read<ProfileEditBloc>().phoneController.text,
                          uid: int.tryParse(context.read<AppToken>().getUid().toString()) ?? 0,
                          image: context.read<ProfileEditBloc>().imageFileUpdate.path,
                        );
                      }
                    },
                    text: 'Save',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
