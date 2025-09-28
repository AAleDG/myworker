import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
  


  RegistrationCubit()
      : super(
          const RegistrationState(),
        );
}
