import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecogrow_customer/gen/assets.gen.dart';
import 'package:flutter_ecogrow_customer/profile/language/view/language_page.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageSelected(Locale('km')));

  int get selectedRadio => state.locale == const Locale('km') ? 1 : 2;

  void setSelectedRadio(int value) {
    emit(value == 1
        ? const LanguageSelected(Locale('km'))
        : const LanguageSelected(Locale('en')),);
  }

  List<LanguageModel> data = [
    LanguageModel(
      locale: const Locale('km'),
      title: 'Khmer',
      image: Assets.images.khmer.path,
      value: 1,
    ),
    LanguageModel(
      locale: const Locale('en'),
      title: 'English',
      image: Assets.images.english.path,
      value: 2,
    ),
  ];

  void selectLanguage(Locale locale) {
    emit(LanguageSelected(locale));
  }
}
