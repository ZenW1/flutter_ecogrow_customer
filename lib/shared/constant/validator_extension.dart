

import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_constant.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

extension ValidatorExtension on dynamic {
   static String orderStatusValidator(OrderStatus status) {
      switch(status){
        case OrderStatus.all :
          return 'All';
        case OrderStatus.processing:
          return 'Processing';
        case OrderStatus.pending:
          return 'Pending';
        case OrderStatus.completed:
          return 'Completed';
        case OrderStatus.cancelled:
          return 'Cancelled';
      }
   }
   static Color orderStatusValidatorColor(OrderStatus status) {
     switch(status){
       case OrderStatus.all :
         return Colors.black;
       case OrderStatus.processing:
         return AppColors.blueColor;
       case OrderStatus.pending:
         return AppColors.yellowColor;
       case OrderStatus.completed:
         return AppColors.primary;
       case OrderStatus.cancelled:
         return AppColors.redColor;
     }
   }
}