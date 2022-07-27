import 'dart:convert';
import 'package:app_template/core/data_layer/local/local.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalCacheImpl implements LocalCache {
  final SharedPreferences _sharedPreferences;
  LocalCacheImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @override
  String? getToken() {
    return getDataSavedLocally(CacheKeys.token) as String?;
  }

  @override
  Future<void> deleteToken() async {
    try {
      await deleteDataSavedLocally(CacheKeys.token);
    } catch (e) {
      //
    }
  }

  @override
  Future<void> saveToken(String token) async {
    await saveDataLocally(key: CacheKeys.token, value: token);
  }

  @override
  Future<Map<String, dynamic>?> getUserData() async {
    final i = getDataSavedLocally(CacheKeys.user) as Map<String, dynamic>?;
    return i;
  }

  @override
  Future<void> saveUserData(Map<String, dynamic> json) async {
    await saveDataLocally(key: CacheKeys.user, value: json);
  }

  @override
  Future<void> clearCache() async {
    await _sharedPreferences.clear();
  }

  @override
  Object? getDataSavedLocally(String key) async {
    try {
      return _sharedPreferences.get(key);
    } catch (e) {
      /// Log the Error from the Getting the Data
      return null;
    }
  }

  @override
  Future<void> saveDataLocally({required String key, value}) async {
    if (value is String) {
      await _sharedPreferences.setString(key, value);
    }
    if (value is bool) {
      await _sharedPreferences.setBool(key, value);
    }
    if (value is List<String>) {
      await _sharedPreferences.setStringList(key, value);
    }
    if (value is int) {
      await _sharedPreferences.setInt(key, value);
    }
    if (value is double) {
      await _sharedPreferences.setDouble(key, value);
    }
    if (value is Map) {
      await _sharedPreferences.setString(key, jsonEncode(value));
    }
  }

  @override
  Future<void> deleteDataSavedLocally(String key) async {
    await _sharedPreferences.remove(key);
  }

  @override
  bool containsKey(String key) {
    return _sharedPreferences.containsKey(key);
  }
}
