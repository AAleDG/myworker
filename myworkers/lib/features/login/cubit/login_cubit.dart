import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginCubit() : super(const LoginState());

  void initCubit() {
    emailController.clear();
    passwordController.clear();
  }

  void updatePassword(String password) {
    passwordController.text = password;
    emit(state.copyWith(password: password));
  }

  void updateEmail(String email) {
    emailController.text = email;
    emit(state.copyWith(email: email));
  }

  void toggleShowPassword() =>
      emit(state.copyWith(showPassword: !state.showPassword));

  void updateDataaccess() =>
      emit(state.copyWith(rememberAccessData: !state.rememberAccessData));
}
