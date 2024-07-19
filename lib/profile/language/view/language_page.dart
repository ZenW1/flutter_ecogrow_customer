import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecogrow_customer/l10n/l10n.dart';

import 'package:flutter_ecogrow_customer/profile/language/language.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_ecogrow_customer/shared/widget/app_bar_widget.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  static const String routePath = '/language';

  @override
  Widget build(BuildContext context) {
    return const LanguageView();
  }
}

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: context.l10n.english,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: context.read<LanguageCubit>().data.length,
          itemBuilder: (context, index) {
            final data = context.read<LanguageCubit>().data[index];
            return FilterChip(
              backgroundColor: Colors.white,
              label: Row(
                children: [
                  Image.asset(
                    data.image,
                    width: 32,
                    height: 32,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    data.title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.blackColor,
                        ),
                  ),
                  const Spacer(),
                  Radio(
                    value: data.value,
                    groupValue: context.read<LanguageCubit>().selectedRadio,
                    focusColor: AppColors.primary,
                    onChanged: (value) {
                      context.read<LanguageCubit>().setSelectedRadio(value!);
                      setState(() {});
                    },
                  ),
                ],
              ),
              onSelected: (bool? onSelected) {
                context.read<LanguageCubit>().selectLanguage(
                      data.locale!,
                    );
              },
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
        ),
      ),
    );
  }
}

class LanguageModel {
  const LanguageModel({
    required this.locale,
    required this.title,
    required this.image,
    required this.value,
  });
  final Locale? locale;
  final String title;
  final String image;
  final int? value;
}
