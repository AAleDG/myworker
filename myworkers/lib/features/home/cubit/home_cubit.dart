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

  Future<void> getCurrentUser(UserEntity? userEntity) async {
    final supabase = Supabase.instance.client;

    UserEntity? userEntityy = userEntity;

    emit(state.copyWith(user: userEntityy));
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
