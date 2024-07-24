import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/main/main.dart';

import 'package:flutter_ecogrow_customer/register/register.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_bar_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_title_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:flutter_ecogrow_customer/shared/widget/global_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const String routePath = '/register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: const RegisterView(),
    );
  }
}

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
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
                              onTap: () => context.read<RegisterCubit>().getImage(ImageSource.gallery),
                              child: const CircleAvatar(
                                radius: 50,
                                foregroundImage: NetworkImage(
                                  'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
                                ),
                              ),
                            )
                          else
                            InkWell(
                              onTap: () => context.read<RegisterCubit>().getImage(ImageSource.gallery),
                              child: CircleAvatar(
                                radius: 50,
                                foregroundImage: FileImage(state.image!),
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
                      controller: context.read<RegisterCubit>().userNameController,
                      hintText: 'Your username',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppTitleWidget(
                      text: 'Email',
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GlobalTextField(
                      textInputType: TextInputType.emailAddress,
                      controller: context.read<RegisterCubit>().emailController,
                      hintText: 'Your email',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppTitleWidget(
                      text: 'Phone number',
                      fontWeight: FontWeight.w400,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GlobalTextField(
                            textInputType: TextInputType.number,
                            controller: TextEditingController(),
                            hintText: '🇰🇭 +855',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 3,
                          child: GlobalTextField(
                            textInputType: TextInputType.number,
                            controller: context.read<RegisterCubit>().phoneNumber,
                            hintText: 'Your phone number',
                          ),
                        ),
                      ],
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
                      controller: TextEditingController(),
                      hintText: 'Your date of birth',
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: AppButton.roundedFilledButton(
                        context,
                        onTap: () {
                          context.go(MainPage.routePath);
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
