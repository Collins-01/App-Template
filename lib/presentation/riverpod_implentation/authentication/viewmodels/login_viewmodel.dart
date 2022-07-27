import 'package:app_template/core/injection_container.dart';
import 'package:app_template/core/interfaces/auth_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/states.dart';

final _authRepository = locator<AuthRepository>();

class LoginViewModel extends StateNotifier<LoginViewModelState> {
  final Ref ref;
  LoginViewModel(this.ref)
      : super(const LoginViewModelState(status: LoginViewModelStatus.idle));

  login(String email, String password) async {
    try {
      state = state.copyWith(status: LoginViewModelStatus.loading);
      await _authRepository.login(email: email, password: password);
      state = state.copyWith(status: LoginViewModelStatus.success);
      //Navigate To Next Page
    } catch (e) {
      //
      state = state.copyWith(
        status: LoginViewModelStatus.error,
      );
    }
  }
}

final loginViewModelInstance =
    StateNotifierProvider<LoginViewModel, LoginViewModelState>(
        (r) => LoginViewModel(r));
