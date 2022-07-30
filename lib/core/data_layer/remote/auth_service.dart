import 'package:app_template/core/interfaces/auth_interface.dart';
import 'package:app_template/core/models/user_model.dart';

class AuthServiceImpl implements AuthService {
  // Uses The network Client here.
  User? _user;
  @override
  Future<void> logOut() async {}

  @override
  Future<void> login({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 3));
    print("Done");
  }

  @override
  Future<void> signUp() async {}

  @override
  User? get currentUser => _user;

  @override
  bool get isAuthenticated => false;
}
