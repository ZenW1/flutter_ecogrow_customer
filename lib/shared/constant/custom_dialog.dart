import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension CustomDialog on Widget {
  static Future<void> showSuccessDialog() async {
    await Fluttertoast.showToast(
      msg: 'Cart have been updated successfully',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: AppColors.whiteColor,
      textColor: AppColors.primary,
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

extension CustomSnackBar on BuildContext {
  BuildContext get context => this;

  Future<void> showSuccessSnackBar(String? message) async {
    await ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: AppColors.primary,
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              message!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.primary),
            ),
          ],
        ),
        dismissDirection: DismissDirection.up,
        backgroundColor: AppColors.whiteColor,
        duration: const Duration(seconds: 2),
        actionOverflowThreshold: 0.8,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
            bottom: MediaQuery.sizeOf(context).height - 230,
            left: 10,
            right: 10),
      ),
    );
  }
}
