import 'package:app_template/core/interfaces/auth_interface.dart';
import 'package:app_template/core/models/user_model.dart';

class AuthServiceImpl implements AuthService {
  // Uses The network Client here.
  User? _user;
  @override
  Future<void> logOut() async {}

  @override
  Future<void> login({required String email, required String password}) async {}

  @override
  Future<void> signUp() async {}

  @override
  User? get currentUser => _user;

  @override
  bool get isAuthenticated => _user != null;
}
