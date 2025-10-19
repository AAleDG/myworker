import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myworkers/domain/user/user_entity.dart';
import 'package:myworkers/features/firebase/auth_gate.dart';
import 'package:myworkers/features/home/presentation/current_user_screen.dart';
import 'package:myworkers/features/persona_information/presentation/personal_information_screen.dart';
import 'package:myworkers/features/requests/presentation/request_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
          const HomeState(),
        );

  Future<void> getCurrentUser() async {
    final userDoc = FirebaseFirestore.instance
        .collection('users')
        .doc(GoogleSignInService.getCurrentUser()?.uid);
    final docSnapshot = await userDoc.get();
    if (docSnapshot.exists) {
      final user = UserEntity(
        uid: docSnapshot.get('uid') ?? '',
        email: docSnapshot.get('email') ?? '',
        name: docSnapshot.get('name') ?? '',
        cf: docSnapshot.get('cf') ?? '',
        surname: docSnapshot.get('surname') ?? '',
      );
      emit(state.copyWith(user: user));
    }
  }

  void updateIndex(int newIndex) => emit(state.copyWith(index: newIndex));

  Widget bodyWidget() => switch (state.index) {
        0 => const CurrentUserScreen(),
        1 => const RequestScreen(),
        _ => PersonalInformationScreen(
            user: state.user,
          ),
      };
}
