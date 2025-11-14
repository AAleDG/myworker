part of 'registration_cubit.dart';

class RegistrationState extends Equatable {
  final bool showPassword;
  final String gender;
  final String email;
  final String password;
  final String surname;
  final String phone;
  final String name;
  final String cf;
  final bool isAwaitingConfirmation;
  final bool isLoading;
  final String? errorMessage;

  const RegistrationState({
    this.showPassword = false,
    this.gender = '',
    this.email = '',
    this.password = '',
    this.surname = '',
    this.phone = '',
    this.name = '',
    this.cf = '',
    this.isAwaitingConfirmation = false,
    this.isLoading = false,
    this.errorMessage,
  });
  @override
  List<Object?> get props => [
        showPassword,
        gender,
        email,
        password,
        surname,
        phone,
        name,
        cf,
        isAwaitingConfirmation,
        isLoading,
        errorMessage,
      ];

  RegistrationState copyWith({
    bool? showPassword,
    String? gender,
    String? email,
    String? password,
    String? surname,
    String? phone,
    String? name,
    String? cf,
    bool? isAwaitingConfirmation,
    bool? isLoading,
    String? errorMessage,
  }) {
    return RegistrationState(
      showPassword: showPassword ?? this.showPassword,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      password: password ?? this.password,
      surname: surname ?? this.surname,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      cf: cf ?? this.cf,
      isAwaitingConfirmation:
          isAwaitingConfirmation ?? this.isAwaitingConfirmation,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
