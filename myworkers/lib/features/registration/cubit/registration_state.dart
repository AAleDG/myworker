part of 'registration_cubit.dart';

class RegistrationState extends Equatable {
  final bool showPassword;
  final String gender;
  const RegistrationState({
     this.showPassword=false,
     this.gender='',
  });
  @override
  List<Object?> get props => [
        showPassword,
        gender,
      ];

  RegistrationState copyWith({
    bool? showPassword,
    String? gender,
  }) =>
      RegistrationState(
        showPassword: showPassword ?? this.showPassword,
        gender: gender ?? this.gender,
      );
}
