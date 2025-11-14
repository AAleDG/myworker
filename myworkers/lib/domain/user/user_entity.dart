import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? uid;
  final String? phoneNumber;
  final String? cf;
  final String? email;
  final String? name;
  final String? surname;

  const UserEntity({
    this.uid,
    this.phoneNumber,
    this.cf,
    this.email,
    this.name,
    this.surname,
  });

  @override
  List<Object?> get props => [
        uid,
        phoneNumber,
        cf,
        email,
        name,
        surname,
      ];

  UserEntity copyWith({
    String? uid,
    String? phoneNumber,
    String? cf,
    String? email,
    String? name,
    String? surname,
  }) {
    return UserEntity(
      uid: uid ?? this.uid,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      cf: cf ?? this.cf,
      email: email ?? this.email,
      name: name ?? this.name,
      surname: surname ?? this.surname,
    );
  }
}
