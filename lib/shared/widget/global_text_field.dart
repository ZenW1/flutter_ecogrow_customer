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
    this.focusNode,
    this.prefix,
    this.onTap,
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
  final VoidCallback? onTap;
  TextStyle? style;
  TextStyle? labelStyle;
  TextStyle? hintStyle;
  Color? suffixIconColor;
  Color? prefixIconColor;
  Widget? suffixIcon;
  Widget? prefixIcon;
  Widget? prefix;
  bool? filled;
  bool? obSecureText;
  bool? autoFocus;
  FocusNode? focusNode;
  EdgeInsetsGeometry? contentPadding;
  String? labelText;

  @override
  State<GlobalTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderOnForeground: false,
      borderRadius: BorderRadius.circular(12),
      child: TextFormField(
        key: widget.key,
        validator: widget.validator,
        keyboardType: widget.textInputType,
        controller: widget.controller,
        onEditingComplete: () {
          if (widget.focusNode != null) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).unfocus();
          }
        },
        // onTapOutside: (pointDownEvent) {
        //   Focus.of(context).unfocus();
        // },
        onTap: widget.onTap,
        focusNode: widget.focusNode,
        textDirection: TextDirection.ltr,
        onFieldSubmitted: widget.onSubmitted,
        textInputAction: TextInputAction.done,
        maxLines: widget.maxLines ?? 1,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        autofocus: widget.autoFocus ?? false,
        obscureText: widget.obSecureText ?? false,
        obscuringCharacter: '*',
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
              color: AppColors.backgroundGrey.withOpacity(0.2),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.backgroundGrey.withOpacity(0.2),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.backgroundGrey.withOpacity(0.2),
            ),
          ),
          suffixIcon: widget.suffixIcon,
          suffixIconColor: widget.suffixIconColor,
          prefixIconColor: widget.prefixIconColor,
          prefixIcon: widget.prefixIcon ?? null,
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
                color: widget.labelColor ?? AppColors.greyColor,
              ),
          // prefixText: '+855',
          prefix: widget.prefix,
          prefixStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
          fillColor: AppColors.backgroundGrey,
          filled: true ?? widget.filled,
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
        enabled: true,
      ),
    );
  }
}

class PrefixNumberIcon extends StatelessWidget {
  const PrefixNumberIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '+855',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
            ),
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              height: 16,
              child: const VerticalDivider(
                color: AppColors.primary,
                thickness: 1,
                width: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
