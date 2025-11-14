part of 'personal_information_cubit.dart';

sealed class PersonalInformationState extends Equatable {
  const PersonalInformationState();

  @override
  List<Object> get props => [];
}

final class PersonalInformationInitial extends PersonalInformationState {}
