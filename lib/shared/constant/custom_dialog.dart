import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension CustomDialog on Fluttertoast {
  static Future<void> showSuccessDialog() async {
    await Fluttertoast.showToast(
      msg: 'Success',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  static Future<void> showErrorDialog(String? message) async {
    await Fluttertoast.showToast(
      msg: message!,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  static Future<void> showWarningDialog(String? message) async {
    await Fluttertoast.showToast(
      msg: message!,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
      fontSize: 16,
    );
  }
}
