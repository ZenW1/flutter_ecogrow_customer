import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

extension CustomConstantWidget on Widget {
  static BoxDecoration shadowBoxDecorationWidget(
      {double? radius, Color? color}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 10),
      color: color ?? AppColors.backgroundColor,
      boxShadow: [
        BoxShadow(
          color: AppColors.primary.withOpacity(0.1),
          spreadRadius: 0,
          blurRadius: 2,
          offset: const Offset(1, 1),
        ),
      ],
    );
  }
}

extension AutoFocusNode on FocusNode {
  static void requestFocusNode(BuildContext context, FocusNode focusNode) {
    return FocusScope.of(context).requestFocus(focusNode);
  }

  static void unFocusNode(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}

extension CheckOrderStatus on  int{
   static dynamic checkStatusById(int id){
     switch(id) {
       case 1:
         return OrderStatus.completed;
       case 4:
         return OrderStatus.cancelled;
       case 5:
          return OrderStatus.pending;
       case 6:
          return OrderStatus.processing;
       default :
         return OrderStatus.all;
     }
   }
}
