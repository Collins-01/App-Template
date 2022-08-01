import 'package:app_template/core/interfaces/auth_interface.dart';
import 'package:app_template/core/models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;
  AuthRepositoryImpl({required AuthService authService})
      : _authService = authService;
  @override
  Future<void> logOut() async {
    await _authService.logOut();
  }

  @override
  Future<void> login({required String email, required String password}) async {
    await _authService.login(email: email, password: password);
  }

  @override
  Future<void> signUp() async {
    await _authService.signUp();
  }

  @override
  User? get currentUser => _authService.currentUser;

  @override
  bool get isAuthenticated => _authService.isAuthenticated;

  @override
  Future<bool> init() async {
    return false;
  }
}
