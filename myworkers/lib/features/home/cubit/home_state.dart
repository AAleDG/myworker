part of 'home_cubit.dart';

class HomeState extends Equatable {
  final User? user;
  final int index;
  
  const HomeState({
    this.user,
    this.index = 0,
  });
  @override
  List<Object?> get props => [
        user,
        index,
      ];

  HomeState copyWith({
    User? user,
    int? index,
  }) {
    return HomeState(
      user: user ?? this.user,
      index: index ?? this.index,
    );
  }
}
