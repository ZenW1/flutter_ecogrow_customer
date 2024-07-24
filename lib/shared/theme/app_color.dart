import 'package:flutter/material.dart';

class AppColors {
  factory AppColors() => _instance;
  AppColors._();
  static final AppColors _instance = AppColors._();

  static const Color primary = Color(0xFF00826C);
  static const Color secondaryColor = Color(0xFF006838);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color greyColor = Color(0xFF959DA3);
  static const Color blackColor = Color(0xFF020202);
  static const Color redColor = Color(0xFFED1C24);
  static const Color backgroundColor = Color(0xFFFAFAFA);
  static const Color backgroundGrey = Color(0xFFF1F1F1);
  static const Color lightGreyColor = Color(0xFFE5E5E5);
  static const Color yellowColor = Color(0xFFF2B917);
  static  Color shadowColor = const Color(0xFFC4C4C4).withOpacity(0.25);
}
