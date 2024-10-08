import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_ecogrow_customer/data/model/cart_list_response_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageService {
  LocalStorageService._();

  static final LocalStorageService _instance = LocalStorageService._();

  static Box<dynamic>? _box;

  static Future<void> initialize() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(
      Directory(appDocumentDirectory.path).path,
    );
    _box = await Hive.openBox('object_storage');
  }

  static Future<void> storeObject(String key, dynamic object) async {
    await _box?.put(key, object);

    log('storeObject($key, ${jsonEncode(object)})');
  }

  static Future<List<CartModel>> getObject(String key) async {
    return await _box?.get(key) as List<CartModel>;
  }

  static Future<void> removeObject(String key) async {
    await _box?.delete(key);
  }

  static Future<void> clearStorage() async {
    await _box?.clear();
  }
}
