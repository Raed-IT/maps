import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:maps/app/data/models/task_model.dart';
import 'package:maps/app/data/routes.dart';

class LocalStorageService {
  LocalStorageService._();

  static final LocalStorageService _instance = LocalStorageService._();

  factory LocalStorageService() {
    return _instance;
  }

  static final GetStorage _storage = GetStorage(AppRoutes.appName);

  static Future<void> write(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  static Future<void> init() async {
    await GetStorage.init(AppRoutes.appName);
  }

  static Future<String> read(String key) async {
    if (_storage.hasData(key)) {
      return await _storage.read(key);
    } else {
      return "";
    }
  }

  static Future  remove(String key) async {
    if (_storage.hasData(key)) {
        await _storage.remove(key);
    }
  }

}
