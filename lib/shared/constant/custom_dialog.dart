import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomDialog {
  Future<void> showSuccessDialog() async {
    await Fluttertoast.showToast(
      msg: 'Success',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  Future<void> showErrorDialog() async {
    await Fluttertoast.showToast(
      msg: 'Error',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  Future<void> showWarningDialog() async {
    await Fluttertoast.showToast(
      msg: 'Warning',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
      fontSize: 16,
    );
  }
}
