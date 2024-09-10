import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

class GlobalTextField extends StatefulWidget {
  GlobalTextField({
    required this.textInputType,
    required this.controller,
    required this.hintText,
    super.key,
    this.contentPadding,
    this.filled,
    this.validator,
    this.labelText,
    this.onChanged,
    this.maxLines,
    this.inputFormatter,
    this.labelColor,
    this.onSaved,
    this.obSecureText,
    this.onSubmitted,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconColor,
    this.prefixIconColor,
    this.hintStyle,
    this.labelStyle,
    this.style,
    this.autoFocus,
  });

  final TextInputType textInputType;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final Function(String)? onSubmitted;
  final TextInputFormatter? inputFormatter;
  final Color? labelColor;
  final int? maxLines;
  final Function(String?)? onSaved;
  Function(String)? onChanged;
  TextStyle? style;
  TextStyle? labelStyle;
  TextStyle? hintStyle;
  Color? suffixIconColor;
  Color? prefixIconColor;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool? filled;
  bool? obSecureText;
  EdgeInsetsGeometry? contentPadding;
  String? labelText;
  bool? autoFocus;

  @override
  State<GlobalTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderOnForeground: false,
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: TextFormField(
          key: widget.key,
          validator: widget.validator,
          keyboardType: widget.textInputType,
          controller: widget.controller,
          onEditingComplete: () {
            FocusScope.of(context).unfocus();
          },
          focusNode: FocusNode(),
          textDirection: TextDirection.ltr,
          onFieldSubmitted: widget.onSubmitted,
          textInputAction: TextInputAction.done,
          maxLines: widget.maxLines ?? 1,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          obscureText: widget.obSecureText ?? false,
          obscuringCharacter: '*',
          autofocus: widget.autoFocus ?? false,
          style: widget.style,
          decoration: InputDecoration(
            counterStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
            // border: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(12),
            //     borderSide: const BorderSide(
            //       width: 0.5,
            //     )
            //   borderSide: BorderSide.none,
            // ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.greyColor.withOpacity(0.5),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.greyColor.withOpacity(0.5),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.greyColor.withOpacity(0.5),
              ),
            ),
            suffixIcon: widget.suffixIcon,
            suffixIconColor: widget.suffixIconColor,
            prefixIconColor: widget.prefixIconColor,
            prefixIcon: widget.prefixIcon,
            hintText: widget.hintText,

            hintStyle: widget.hintStyle ??
                Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyColor,
                    ),
            labelText: widget.labelText,
            labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: widget.labelColor ?? AppColors.primary,
                ),
            // labelStyle: widget.labelStyle,
            fillColor: Colors.white,
            filled: widget.filled,
            contentPadding: widget.contentPadding,
          ),
          enabled: true,
        ),
      ),
    );
  }
}
