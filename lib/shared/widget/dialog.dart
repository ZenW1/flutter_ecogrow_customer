import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

// enum DialogType {
//   INFO,
//   WARNING,
//   ERROR,
//   SUCCES,
//   QUESTION,
//   NO_HEADER,
// }

extension AppDialog on BuildContext {
  BuildContext get context => this;
  static AwesomeDialog kkDialog(BuildContext context) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.bottomSlide,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    )..show();
  }
  static alertDialog(
      BuildContext context, {
        required String title,
        required String content,
        String btn = "ok",
        bool headerAnimationLoop = false,
        bool outSideDismiss = false,
        bool dismissOnBackKeyPress = true,
      }) {
    return AwesomeDialog(
      dismissOnBackKeyPress: dismissOnBackKeyPress,
      dismissOnTouchOutside: outSideDismiss,
      headerAnimationLoop: headerAnimationLoop,
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.bottomSlide,
      title: title,
      desc: content,
      btnOkOnPress: () {},
      btnOkText: btn,
    )..show();
  }

  static infoDialog(
      BuildContext context, {
        required String title,
        required String content,
        String btn = "ok",
        bool headerAnimationLoop = false,
        bool outSideDismiss = false,
        bool dismissOnBackKeyPress = true,
      }) {
    return AwesomeDialog(
      dismissOnBackKeyPress: dismissOnBackKeyPress,
      dismissOnTouchOutside: outSideDismiss,
      headerAnimationLoop: headerAnimationLoop,
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.bottomSlide,
      title : title,
      desc: content,
      btnOkOnPress: () {},
      btnOkText: btn,
    )..show();
  }

  static warningDialog(
      BuildContext context, {
        required String title,
        required String content,
        String btn = "ok",
        bool headerAnimationLoop = false,
        bool outSideDismiss = false,
        bool dismissOnBackKeyPress = true,
      }) {
    return AwesomeDialog(
      dismissOnBackKeyPress: dismissOnBackKeyPress,
      dismissOnTouchOutside: outSideDismiss,
      headerAnimationLoop: headerAnimationLoop,
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: title,
      desc: content,
      btnOkOnPress: () {},
      btnOkText: btn,
    )..show();
  }

  static errorDialog(BuildContext context,
      {String? title,
        required String content,
        String btn = "ok",
        bool headerAnimationLoop = false,
        bool outSideDismiss = false,
        bool dismissOnBackKeyPress = true,
        VoidCallback? afterOk}) {
    return AwesomeDialog(
      //show animation header
      customHeader: Icon(
        Icons.error,
        size: 100,
        color: Colors.orange,
      ),
      dismissOnBackKeyPress: dismissOnBackKeyPress,
      dismissOnTouchOutside: outSideDismiss,
      headerAnimationLoop: headerAnimationLoop,
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.bottomSlide,
      title: title,
      desc: content,
      // button background
      btnOkColor: AppColors.primary,
      btnOkOnPress: () {
        if (afterOk != null) {
          afterOk();
        }
      },
      btnOkText: btn,
    )..show();
  }

  static successDialog(BuildContext context,
      {required String title,
        required String content,
        String btn = "ok",
        bool headerAnimationLoop = false,
        bool outSideDismiss = false,
        bool dismissOnBackKeyPress = true,
        required dynamic afterSuccess}) {
    return AwesomeDialog(
      dismissOnBackKeyPress: dismissOnBackKeyPress,
      dismissOnTouchOutside: outSideDismiss,
      headerAnimationLoop: headerAnimationLoop,
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      autoDismiss: true,
      title: title,
      desc:content,
      btnOkOnPress: () {
        afterSuccess();
      },
      btnOkText:btn,
    )..show();
  }

  static questionDialog(
      BuildContext context, {
        bool headerAnimationLoop = false,
        String title = "Confirm",
        String content = "Are you sure?",
        String btnYes = "Yes",
         String btnNo = "No",
        required Function onYes,
        bool outSideDismiss = false,
        bool dismissOnBackKeyPress = true,
      }) {
    return AwesomeDialog(
      dismissOnBackKeyPress: dismissOnBackKeyPress,
      dismissOnTouchOutside: outSideDismiss,
      headerAnimationLoop: headerAnimationLoop,
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.bottomSlide,
      title: title,
      desc: content,
      btnOkColor: AppColors.primary,
      btnCancelColor: AppColors.redColor,
      btnOkOnPress: () {
        onYes();
      },
      btnCancelOnPress: () {
        Navigator.of(context).pop();
      },
      btnOkText: btnYes,
      btnCancelText: btnNo,
    )..show();
  }

  static AwesomeDialog customDialog(BuildContext context,
      {String btn = "Confirm",
        bool headerAnimationLoop = false,
        bool outSideDismiss = false,
        bool dismissOnBackKeyPress = true,
        required Widget body,
        required VoidCallback onTap}) {
    return AwesomeDialog(
      dismissOnBackKeyPress: dismissOnBackKeyPress,
      dismissOnTouchOutside: outSideDismiss,
      headerAnimationLoop: headerAnimationLoop,
      padding: const EdgeInsets.all(5),
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.bottomSlide,
      body: body,
      btnCancel: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          "Cancel",
          style: TextStyle(color: Colors.white),
        ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      btnOkOnPress: onTap,
      btnOk: TextButton(
        onPressed: onTap,
        child: Text(
          btn,
          style: const TextStyle(color: Colors.white),
        ),
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    )..show();
  }

  static customPopupEventDialog(BuildContext context,
      {bool headerAnimationLoop = false,
        bool outSideDismiss = false,
        bool dismissOnBackKeyPress = false,
        required Widget body,
        double borderRadius = 0}) {
    return AwesomeDialog(
        dismissOnBackKeyPress: dismissOnBackKeyPress,
        dismissOnTouchOutside: outSideDismiss,
        headerAnimationLoop: headerAnimationLoop,
        context: context,
        dialogType: DialogType.noHeader,
        animType: AnimType.bottomSlide,
        body: body,
        dialogBorderRadius: BorderRadius.all(Radius.circular(borderRadius)))
      ..show();
  }
}
