// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class LocationService {
//
//   static Future<Placemark> getCurrentLocation() async {
//     bool isServiceEnabled;
//     LocationPermission permission;
//     isServiceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!isServiceEnabled) {
//       return Future.error('Location services are disabled.');
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       // open settings
//
//       if (permission == LocationPermission.deniedForever) {
//         // unawaited(
//         //   showDialog(
//         //     context: context,
//         //     builder: (context) => const AlertDialog(
//         //       title: Text('Location Permission'),
//         //       content: Text('Please enable location permission in your settings'),
//         //       actions: [
//         //         TextButton(
//         //           onPressed: Geolocator.openAppSettings,
//         //           child: Text('OK'),
//         //         ),
//         //       ],
//         //     ),
//         //   ),
//         // );
//         return Future.error('Location permissions are permanently denied, we cannot request permissions.');
//       }
//     }
//     final position = await Geolocator.getCurrentPosition();
//     final placemarks = await placemarkFromCoordinates(
//       position.latitude,
//       position.longitude,
//     );
//     return placemarks.first;
//   }
//
//   static Future<List<Marker>> getOnTapData(LatLng latLng, List<Marker> myMarker, _controller) async {
//     myMarker!.add(
//       Marker(
//         markerId: const MarkerId('1'),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//         position: LatLng(latLng!.latitude, latLng!.longitude),
//         infoWindow: const InfoWindow(
//           title: 'this is my new location',
//           snippet: 'This is your location',
//         ),
//       ),
//     );
//     final newCameraPosition = CameraPosition(
//       target: LatLng(latLng!.latitude, latLng!.longitude),
//       zoom: 15,
//     );
//
//     await _controller.future.then((controller) {
//       controller.animateCamera(
//         CameraUpdate.newCameraPosition(newCameraPosition),
//       );
//     }).then((value) => _controller.isCompleted);
//
//     return myMarker;
//   }
//
//   static Future<void> getDataWhenCameraMove(CameraPosition cameraPosition, List<Marker> myMarker, _controller) async {
//     final placeMarks = await placemarkFromCoordinates(
//       cameraPosition.target.latitude,
//       cameraPosition.target.longitude,
//     );
//     myMarker.add(
//       Marker(
//         markerId: const MarkerId('1'),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//         position: LatLng(
//           cameraPosition.target.latitude,
//           cameraPosition.target.longitude,
//         ),
//         infoWindow: const InfoWindow(
//           title: 'this is my new location',
//           snippet: 'This is your location',
//         ),
//       ),
//     );
//     await _controller.future.then((controller) {
//       controller.animateCamera(
//         CameraUpdate.newCameraPosition(cameraPosition),
//       );
//     });
//   }
//
//  static String getLocationAddress(List<Placemark> placeMarks) {
//     {
//       final address = placeMarks.first;
//
//       final addresses = '${address.name}, ${address.subLocality}, ${address.locality}, ${address.administrativeArea} ${address.postalCode}, ${address.country}';
//       return placeMarks.isNotEmpty ? addresses! : 'No Address';
//     }
//   }
// }
