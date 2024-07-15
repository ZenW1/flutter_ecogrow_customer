import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ecogrow_customer/profile/profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String routePath = '/profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        // TODO: return correct widget based on the state.
        return const SizedBox();
      },
    );
  }
}
