import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CustomPinPutWidget extends StatelessWidget {
  const CustomPinPutWidget({required this.controller, super.key, required this.onChanged, required this.onSubmitted});

  final TextEditingController controller;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Pinput(
      autofocus: true,
      length: 6,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      onSubmitted:onSubmitted,
      isCursorAnimationEnabled: true,
      onChanged: onChanged,
      focusNode: FocusNode(
        canRequestFocus: true,
      ),
      preFilledWidget: const Text('-'),
      controller: controller,
      closeKeyboardWhenCompleted: true,
    );
  }
}
