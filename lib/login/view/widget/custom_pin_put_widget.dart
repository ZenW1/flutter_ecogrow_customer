import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CustomPinPutWidget extends StatelessWidget {
  const CustomPinPutWidget({required this.controller, super.key});

  final TextEditingController controller;
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
      onSubmitted: (String pin) {
        print('submit pin: $pin');
      },
      onChanged: (String pin) {
        print('onChanged pin: $pin');
      },
      preFilledWidget: const Text('-'),
      controller: controller,
    );
  }
}
