import 'package:app_template/core/models/user_model.dart';

abstract class AuthInterface {
  Future<void> login({required String email, required String password});
  Future<void> signUp();
  Future<void> logOut();
  User? get currentUser;
  bool get isAuthenticated;
}

//Interface -> Service -> Repository

abstract class AuthService extends AuthInterface {}

abstract class AuthRepository extends AuthInterface {}
