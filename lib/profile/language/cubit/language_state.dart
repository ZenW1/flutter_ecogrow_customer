part of 'language_cubit.dart';

enum Language { en, kh }

class LanguageState extends Equatable {
  const LanguageState(this.locale);
  final Locale locale;
  @override
  List<Object> get props => [locale];
}

class LanguageSelected extends LanguageState {
  const LanguageSelected(super.locale);
}
