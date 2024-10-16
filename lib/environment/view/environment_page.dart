import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ecogrow_customer/environment/cubit/environment_cubit.dart';

class EnvironmentsPage extends StatelessWidget {
  const EnvironmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EnvironmentCubit(),
      child: const EnvironmentsView(),
    );
  }
}

class EnvironmentsView extends StatelessWidget {
  const EnvironmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnvironmentCubit, EnvironmentState>(
      builder: (context, state) {
        return const SizedBox();
      },
    );
  }
}
