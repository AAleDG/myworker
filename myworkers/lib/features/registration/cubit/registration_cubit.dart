import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myworkers/core/router/router.dart';
import 'package:myworkers/domain/user/user_entity.dart';
import 'package:myworkers/features/supabase/supabase_utilies.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  Timer? _confirmationTimer;

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
    if (!checkStatus) return;

    // Start registration: use the provided password controller value
    emit(state.copyWith(isLoading: true, errorMessage: null));

    SupabaseUtilies()
        .signUpWithEmail(state.email, state.password)
        .then((res) async {
      emit(state.copyWith(isLoading: false));
      if (res.status == SignUpStatus.successWithSession) {
        // Insert user profile data into the 'user' table
        try {
          await Supabase.instance.client.from('user').insert({
            'name': state.name,
            'surname': state.surname,
            'cf': state.cf,
            'password': state.password,
            'email': state.email,
            'phone_number': state.phone,
            // Do NOT store password in the table — Supabase Auth handles it
          });
        } catch (e) {
          debugPrint('Error inserting user profile: $e');
        }

        final user = UserEntity(
          email: state.email,
          name: state.name,
          surname: state.surname,
          cf: state.cf,
          phoneNumber: state.phone,
        );
        // session created - proceed to home
        AutoRouter.of(context).push(HomeRoute(user: user));
      } else if (res.status == SignUpStatus.awaitingConfirmation) {
        // no session - must confirm email
        emit(state.copyWith(isAwaitingConfirmation: true));
        _startConfirmationPolling(context);
      } else {
        emit(state.copyWith(errorMessage: res.message ?? 'Registration error'));
      }
    }).catchError((e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    });
  }

  /// Start polling every 5 seconds to check if the user confirmed their email
  void _startConfirmationPolling(BuildContext context) {
    _confirmationTimer?.cancel();
    _confirmationTimer = Timer.periodic(const Duration(seconds: 5), (_) async {
      final confirmed = await SupabaseUtilies().isEmailConfirmed();
      if (confirmed) {
        _confirmationTimer?.cancel();
        emit(state.copyWith(isAwaitingConfirmation: false));
        AutoRouter.of(context).push(HomeRoute());
      }
    });
  }

  /// Manual re-check (e.g. when the user clicks "I've confirmed")
  Future<void> checkConfirmationNow(BuildContext context) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      // First, try to sign in with the provided credentials (user may have confirmed)
      final signedIn =
          await SupabaseUtilies().signInWithEmail(state.email, state.password);
      if (signedIn) {
        _confirmationTimer?.cancel();
        emit(state.copyWith(isAwaitingConfirmation: false, isLoading: false));

        // Insert user profile data into the 'user' table (if not already done)
        try {
          await Supabase.instance.client.from('user').insert({
            'name': state.name,
            'surname': state.surname,
            'cf': state.cf,
            'password': state.password,
            'email': state.email,
            'phone_number': state.phone,
          });
        } catch (e) {
          debugPrint('Error inserting user profile: $e');
        }

        final user = UserEntity(
          email: state.email,
          name: state.name,
          surname: state.surname,
          cf: state.cf,
          phoneNumber: state.phone,
        );
        AutoRouter.of(context).push(HomeRoute(user: user));
        return;
      }

      // If sign in didn't create a session, check confirmation flag
      final confirmed = await SupabaseUtilies().isEmailConfirmed();
      if (confirmed) {
        // Email confirmed but sign-in failed: ask user to try login manually
        emit(state.copyWith(
            isAwaitingConfirmation: false,
            isLoading: false,
            errorMessage:
                'Email confirmed but automatic sign-in failed. Please try to login.'));
        return;
      }

      // Not confirmed yet
      emit(state.copyWith(
          isLoading: false, errorMessage: 'Email not yet confirmed'));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _confirmationTimer?.cancel();
    return super.close();
  }
}
