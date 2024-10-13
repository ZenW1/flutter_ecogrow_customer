// import 'package:dealer_app/utils/configures/app_colors.dart';
// import 'package:dealer_app/utils/shared/widget/button_widget.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// import '../constant/app_sizer.dart';
//
// class CustomAlertDialogWidget extends StatelessWidget {
//   const CustomAlertDialogWidget({Key? key, required this.onTap}) : super(key: key);
//   final VoidCallback onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       elevation: 0,
//       insetPadding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
//       backgroundColor: Colors.transparent,
//       child: Container(
//         height: 180,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Removed Item".tr(), style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500)),
//             const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
//             Text("areYouSureToDeleteThisProduct".tr(), style: const TextStyle(fontSize: 14, color: Colors.black54)),
//             const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Expanded(
//                     child: ButtonWidget(
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                   text: 'no'.tr(),
//                   textColor: Colors.white,
//                   // color: AppColors.primaryColor,
//                   backgroundColor: AppColors.primaryColor,
//                 )),
//                 Expanded(
//                   child: ButtonWidget(
//                     onTap: onTap,
//                     text: 'yes'.tr(),
//                     backgroundColor: Colors.white,
//                     textColor: AppColors.primaryColor,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
