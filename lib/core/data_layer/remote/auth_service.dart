import 'package:app_template/core/data_layer/local/local.dart';
import 'package:app_template/core/interfaces/auth_interface.dart';
import 'package:app_template/core/models/user_model.dart';

class AuthServiceImpl implements AuthService {
  final LocalCacheImpl _localCacheImpl;
  AuthServiceImpl({required LocalCacheImpl localCacheImpl})
      : _localCacheImpl = localCacheImpl;

  // Uses The network Client here.

  User? _user;
  @override
  Future<void> logOut() async {}

  @override
  Future<void> login({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 1));
    _user = User(id: 'id', email: email);
    await _localCacheImpl.saveDataLocally(
        key: CacheKeys.user, value: _user!.toJson());
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> signUp() async {}

  @override
  User? get currentUser => _user;

  @override
  bool get isAuthenticated => _user != null;

  @override
  Future<bool> init() async {
    try {
      var data = await _localCacheImpl.getUserData();
      if (data != null) {
        return true;
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
