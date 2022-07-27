abstract class LocalCache {
  /// Gets the User's Locally Saved Token
  String? getToken();

  ///Saves the User's Token Locally
  Future<void> saveToken(String token);

  /// Deletes the Token from the Cache
  Future<void> deleteToken();

  /// gets the user's data from the device
  Future<Map<String, dynamic>?> getUserData();

  /// Saves The User data to the Device
  Future<void> saveUserData(Map<String, dynamic> json);
  //=================== CRUD ==================
  ///Saves data locally
  Future<void> saveDataLocally({required String key, required value});

  /// Returns Locally Saved data
  Object? getDataSavedLocally(String key);

  ///Clear Cache
  Future<void> clearCache();

  /// Delete Data
  Future<void> deleteDataSavedLocally(String key);

  containsKey(String key);
}
