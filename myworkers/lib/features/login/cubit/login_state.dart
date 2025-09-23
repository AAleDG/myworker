part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String password;
  final String email;
  final bool showPassword;
  final bool rememberAccessData;

  const LoginState({
    this.password = '',
    this.email = '',
    this.showPassword = true,
    this.rememberAccessData = false,
  });
  @override
  List<Object?> get props => [
        email,
        password,
        showPassword,
        rememberAccessData,
      ];

  LoginState copyWith({
    String? password,
    String? email,
    bool? showPassword,
    bool? rememberAccessData,
  }) {
    return LoginState(
      password: password ?? this.password,
      email: email ?? this.email,
      showPassword: showPassword ?? this.showPassword,
      rememberAccessData: rememberAccessData ?? this.rememberAccessData,
    );
  }
}
