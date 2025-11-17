import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myworkers/domain/user/user_entity.dart';
import 'package:myworkers/features/home/presentation/current_user_screen.dart';
import 'package:myworkers/features/persona_information/presentation/personal_information_screen.dart';
import 'package:myworkers/features/requests/presentation/request_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
          const HomeState(),
        );

  Future<void> getCurrentUser() async {
    final supabase = Supabase.instance.client;
    final User? user = supabase.auth.currentUser;
    UserEntity userEntity = UserEntity(phoneNumber: user?.phone);
    print(userEntity.cf);
    emit(state.copyWith(user: user));
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
