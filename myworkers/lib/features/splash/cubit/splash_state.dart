part of 'splash_cubit.dart';

class SplashState extends Equatable {
  final bool isTimePassed;
  const SplashState({required this.isTimePassed});

  @override
  List<Object> get props => [
        isTimePassed,
      ];

  SplashState copyWith({
    bool? isTimePassed,
  }) =>
      SplashState(
        isTimePassed: isTimePassed ?? this.isTimePassed,
      );
}
