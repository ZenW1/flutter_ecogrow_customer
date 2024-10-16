import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ecogrow_customer/register/register.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_dialog.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_bar_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/global_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const String routePath = '/register';

  @override
  Widget build(BuildContext context) {
    return RegisterView();
  }
}

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  List<String> genderList = ['Male', 'Female'];

  String genderSelected = '';

  String get getGender {
    if (genderSelected == genderList[0]) {
      return 'M';
    } else {
      return 'F';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterInitial) {
          context.loaderOverlay.show();
        } else if (state is RegisterFailed) {
          context.loaderOverlay.hide();
          CustomDialog.showWarningDialog(state.message);
        } else if (state is RegisterLoaded) {
          context.loaderOverlay.hide();
          CustomDialog.showWarningDialog(state.message);
          GoRouter.of(context).go('/home');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const AppBarWidget(
            title: 'Register Profile',
          ),
          resizeToAvoidBottomInset: true,
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          if (state.image == null)
                            InkWell(
                              onTap: () =>
                                  context.read<RegisterCubit>().getImageAndConvertToBase64(ImageSource.gallery),
                              child: const CircleAvatar(
                                radius: 50,
                                foregroundImage: NetworkImage(
                                  'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
                                ),
                              ),
                            )
                          else
                            InkWell(
                              onTap: () =>
                                  context.read<RegisterCubit>().getImageAndConvertToBase64(ImageSource.gallery),
                              child: CircleAvatar(
                                radius: 50,
                                foregroundImage: FileImage(
                                  context.read<RegisterCubit>().state.image!,
                                ),
                              ),
                            ),
                          const Positioned(
                            bottom: 5,
                            right: 5,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Color(0xFFF2F1F6),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Upload Profile Picture',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const AppTitleWidget(
                      text: 'Username',
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GlobalTextField(
                      textInputType: TextInputType.text,
                      autoFocus: true,
                      controller: context.read<RegisterCubit>().userNameController,
                      hintText: 'Your username',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppTitleWidget(
                      text: 'Last Name',
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GlobalTextField(
                      textInputType: TextInputType.text,
                      controller: context.read<RegisterCubit>().lastNameController,
                      hintText: 'Last Name',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppTitleWidget(
                      text: 'Gender',
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 10,
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
                    const SizedBox(
                      height: 20,
                    ),
                    const AppTitleWidget(
                      text: 'Phone number',
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GlobalTextField(
                      textInputType: TextInputType.number,
                      controller: context.read<RegisterCubit>().phoneNumber,
                      hintText: 'Your phone number',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppTitleWidget(
                      text: 'Date of Birth',
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GlobalTextField(
                      textInputType: TextInputType.datetime,
                      controller: context.read<RegisterCubit>().dobController,
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
                            context.read<RegisterCubit>().dobController.text = formattedDate;
                          }
                        });
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: AppButton.roundedFilledButton(
                        context,
                        onTap: () async {
                          context.read<RegisterCubit>().registerUser(
                                firstName: context.read<RegisterCubit>().userNameController.text,
                                lastName: context.read<RegisterCubit>().userNameController.text,
                                gender: getGender,
                                dob: context.read<RegisterCubit>().dobController.text,
                                image: ImageConstants.constants.convertToBase64(state.image!).toString(),
                                phoneNumber: context.read<RegisterCubit>().phoneNumber.text,
                              );
                        },
                        text: 'REGISTER',
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
