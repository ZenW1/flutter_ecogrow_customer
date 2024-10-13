// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
//
// import 'package:flutter_ecogrow_customer/data/model/cart_list_response_model.dart';
// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart';
//
// class LocalStorageService {
//   LocalStorageService._();
//
//   static final LocalStorageService _instance = LocalStorageService._();
//
//   static Box<dynamic>? _box;
//
//
//   static Future<void> initialize() async {
//     final appDocumentDirectory = await getApplicationDocumentsDirectory();
//     Hive.init(
//       Directory(appDocumentDirectory.path).path,
//     );
//     _box = await Hive.openBox('object_storage');
//   }
//
//   static Future<void> storeObject(String key, dynamic object) async {
//     log('storeObject($key, ${jsonEncode(object)})');
//
//     await _box?.put(key, object);
//   }
//
//   static void writeCallHistoryItems(List<CartModel> hiveCallHistoryItemModels) async {
//     var callHistoryBox = await Hive.openBox<List<CartModel>>('callHistory');
//
//     log('writeCallHistoryItems(${jsonEncode(hiveCallHistoryItemModels)})');
//
//     await callHistoryBox.put('call_history', hiveCallHistoryItemModels);
//   }
//
//   static Future<List<CartModel>> readcallHistoryItems() async {
//     var callHistoryBox = await Hive.openBox<List<CartModel>>('callHistory');
//     var callHistory = callHistoryBox.values;
//
//     if (callHistory == null || callHistory == [] || callHistory.isEmpty) {
//       callHistory = [];
//     }
//     return callHistory.first;
//   }
//
//   // update at index
//
//   static void updateAtIndex(String key, int index, dynamic object) async {
//     log('updateAtIndex($key, $index, ${jsonEncode(object)})');
//     var list = _box?.get(key) as List<dynamic>;
//     list[index] = object;
//     await _box?.put(key, list);
//   }
//
//   // static CartListResponseModel getObject(String key)  {
//   //
//   //   log('getObject($key)');
//   //   return  _box?.get(key) as CartListResponseModel;
//   // }
//   //
//   // get object from storage
//
//   static dynamic getObject(String key) {
//     log('getObject($key)');
//     return _box?.get(key);
//   }
//
//   static Future<void> removeObject(String key) async {
//     await _box?.delete(key);
//   }
//
//   static Future<void> clearStorage() async {
//     await _box?.clear();
//   }
// }
