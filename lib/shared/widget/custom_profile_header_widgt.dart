import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/profile/cubit/profile_cubit.dart';
import 'package:flutter_ecogrow_customer/profile/cubit/profile_edit/profile_edit_bloc.dart';
import 'package:flutter_ecogrow_customer/profile/view/profile_edit_page.dart';
import 'package:flutter_ecogrow_customer/shared/widget/custom_buttons_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class CustomProfileHeader extends StatelessWidget {
  const CustomProfileHeader({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProfileLoadSuccess) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            color: Colors.grey.withOpacity(0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'profile',
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: Image.network(
                      state.data.image!,
                      fit: BoxFit.cover,
                    ).image,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  '${state.data.firstName} ${state.data.lastName}' ?? '',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(
                  height: 16,
                ),
                // Text(
                //   'Project Manager',
                //   style: Theme.of(context).textTheme.displaySmall,
                // ),
                // const SizedBox(
                //   height: 16,
                // ),
                AppButton.roundedFilledButton(
                  context,
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 45,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>  ProfileEditPage(imageUrl: state.data.image!))
                    );
                    context.read<ProfileEditBloc>().firstNameController.text =
                        state.data.firstName!;
                    context.read<ProfileEditBloc>().lastNameController.text =
                        state.data.lastName!;
                    context.read<ProfileEditBloc>().phoneController.text =
                        state.data.phoneNumber!;

                    final dateFormat = DateFormat('yyyy-MM-dd');
                    final dateTime = dateFormat.parse(state.data.dob!.toString());

                    context.read<ProfileEditBloc>().dobController.text = dateFormat.format(dateTime);
                    context.read<ProfileEditBloc>().imageUrl = state.data.image!;
                  },
                  text: 'Edit Profile',
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  height: 16,
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text('${userModel.firstName} ${userModel.lastName}' ?? ''),
                //     Text.rich(
                //       style: Theme.of(context).textTheme.bodySmall!.copyWith(
                //         color: AppColors.greyColor,
                //       ),
                //       const TextSpan(
                //         text: '10 Orders',
                //         children: [
                //           TextSpan(
                //             text: '. 0 wishlist',
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          );
        } else {
          return Center(
            child: Text('Error'),
          );
        }
      },
    );
  }
}
