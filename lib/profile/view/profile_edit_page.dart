import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/data/model/user_info_model.dart';
import 'package:flutter_ecogrow_customer/profile/cubit/profile_edit/profile_edit_bloc.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/global_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({required this.imageUrl, super.key});

  static const String routePath = '/profile/edit';

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileEditBloc, ProfileEditState>(
      listener: (context, state) {
        if (state is ProfileEditLoadSuccess) {
          GoRouter.of(context).pop();
        } else if (state is ProfileEditFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        } else if (state is ProfileEditUploadImage) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Image uploaded successfully'),
            ),
          );
        }
      },
      child: ProfileEditView(),
    );
  }
}

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: BlocBuilder<ProfileEditBloc, ProfileEditState>(
        builder: (context, state) {
          return SingleChildScrollView(
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
                        : CircleAvatar(
                            radius: 50,
                            backgroundImage: Image.network(
                              // picuture
                              'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fprofile%2520picture%2F&psig=AOvVaw3'
                            ).image,
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
                  const AppTitleWidget(text: 'Email'),
                  const SizedBox(
                    height: 16,
                  ),
                  GlobalTextField(
                    textInputType: TextInputType.text,
                    controller: TextEditingController(),
                    hintText: 'Input your email',
                    labelText: 'Email',
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
                  const AppTitleWidget(text: 'Address'),
                  const SizedBox(
                    height: 16,
                  ),
                  GlobalTextField(
                    textInputType: TextInputType.text,
                    controller: TextEditingController(),
                    hintText: 'Input your address',
                    labelText: 'Physical address',
                  ),
                ],
              ),
            ),
          );
        },
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
                  context.read<ProfileEditBloc>().add(
                        ProfileOnEditEvent(
                          UserInfoModel(
                              data: UserModel(
                            firstName: context.read<ProfileEditBloc>().firstNameController.text,
                            lastName: context.read<ProfileEditBloc>().lastNameController.text,
                            phoneNumber: context.read<ProfileEditBloc>().phoneController.text,
                            dob: DateTime.tryParse(context.read<ProfileEditBloc>().dobController.text),
                            image: context.read<ProfileEditBloc>().base64Image,
                            id: int.parse('20'),
                          )),
                        ),
                      );
                },
                text: 'Save',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
