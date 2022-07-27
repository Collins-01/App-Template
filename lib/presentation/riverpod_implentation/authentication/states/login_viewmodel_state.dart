import 'package:equatable/equatable.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

enum LoginViewModelStatus { idle, loading, error, success }

extension LoginViewModelStatusX on LoginViewModelStatus {
  bool get isBusy => this == LoginViewModelStatus.loading;
  bool get isIdle => this == LoginViewModelStatus.idle;
  bool get isError => this == LoginViewModelStatus.error;
  bool get isSuccess => this == LoginViewModelStatus.success;
}

class LoginViewModelState extends Equatable {
  final LoginViewModelStatus status;
  final String loginError;
  const LoginViewModelState(
      {this.status = LoginViewModelStatus.idle, this.loginError = ''});

  LoginViewModelState copyWith(
      {LoginViewModelStatus? status, String? loginError}) {
    return LoginViewModelState(
      status: status ?? this.status,
      loginError: loginError ?? this.loginError,
    );
  }

  @override
  List<Object?> get props => [status, loginError];
}
