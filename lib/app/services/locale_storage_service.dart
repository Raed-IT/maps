import 'package:get_storage/get_storage.dart';
import 'package:maps/app/data/routes.dart';
class LocalStorageService {
  LocalStorageService._();

  static final LocalStorageService _instance = LocalStorageService._();

  factory LocalStorageService() {
    return _instance;
  }

  // GetStorage instance
  static final GetStorage _storage = GetStorage(AppRoutes.appName);

  // Method to write data
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


}
