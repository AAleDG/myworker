import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState(isTimePassed: false));

  Future<void> startSplashTimer() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(isTimePassed: true));
  }
}
