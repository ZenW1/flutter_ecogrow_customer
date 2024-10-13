// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class CustomNoData extends StatelessWidget {
//   const CustomNoData({Key? key, required this.type}) : super(key: key);
//   final TypeNoData type;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: type == TypeNoData.noCart
//             ? Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SvgPicture.asset(
//               'assets/svg/no_data.svg',
//               height: 150,
//               width: 150,
//             ),
//             const SizedBox(height: 10),
//             Text("yourCartIsEmpty".tr(),
//                 style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600)),
//             Text("lookLikeYouHaveNotAddedAnyItemToCart".tr(), style: const TextStyle(fontSize: 12, color: Colors.black54)),
//           ],
//         )
//             : type == TypeNoData.oUnpaidPayment
//             ? Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SvgPicture.asset(
//               'assets/svg/no_data.svg',
//               height: 150,
//               width: 150,
//             ),
//             const SizedBox(height: 10),
//             Text("noUnpaidPayment".tr(),
//                 style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600)),
//             Text("youHaveNoUnpaidPayment".tr(), style: const TextStyle(fontSize: 12, color: Colors.black54)),
//           ],
//         )
//             : const SizedBox());
//   }
// }
//
// enum TypeNoData { noCart, oUnpaidPayment } // add more type no data
