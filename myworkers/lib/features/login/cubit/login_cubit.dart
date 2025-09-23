import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myworkers/core/router/router.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginCubit() : super(const LoginState());

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

  void checkStatus(BuildContext context,) {
    AutoRouter.of(context).push(const HomeRoute());
  }

  void updateDataaccess() =>
      emit(state.copyWith(rememberAccessData: !state.rememberAccessData));
}
