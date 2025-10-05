import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myworkers/core/router/router.dart';
import 'package:myworkers/features/firebase/auth_gate.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cfController = TextEditingController();
  final TextEditingController phoneConfirmController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  RegistrationCubit()
      : super(
          const RegistrationState(),
        );

  void updatePassword(String password) {
    passwordController.text = password;
    emit(state.copyWith(password: password));
  }

  void updateEmail(String email) {
    emailController.text = email;
    emit(state.copyWith(email: email));
  }

  void updateName(String name) {
    nameController.text = name;
    emit(state.copyWith(name: name));
  }

  void updateCF(String cf) {
    cfController.text = cf.toUpperCase();
    emit(state.copyWith(cf: cf));
  }

  void updateSurname(String surname) {
    surnameController.text = surname;
    emit(state.copyWith(surname: surname));
  }

  void updateGender(String gender) {
    genderController.text = gender;
    emit(state.copyWith(gender: gender));
  }

  void updatePhone(String phone) {
    phoneController.text = phone;
    emit(state.copyWith(phone: phone));
  }

  void toggleShowPassword() =>
      emit(state.copyWith(showPassword: !state.showPassword));

  void checkStatus(
    BuildContext context,
    bool checkStatus,
  ) {
    if (checkStatus) {
      GoogleSignInService()
          .registerNewUser(
        emailController.text,
        passwordController.text,
        nameController.text,
        surnameController.text,
        cfController.text,
        phoneController.text,
      )
          .then((value) {
        AutoRouter.of(context).push(HomeRoute());
      });
      // AuthService()
      //     .registerNewUser(
      //   emailController.text,
      //   passwordController.text,
      // )
      //     .then((value) {
      //   AutoRouter.of(context).push(HomeRoute());
      // });
    } else {
      return;
    }
  }
}
