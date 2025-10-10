// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [CurrentUserScreen]
class CurrentUserRoute extends PageRouteInfo<void> {
  const CurrentUserRoute({List<PageRouteInfo>? children})
      : super(
          CurrentUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'CurrentUserRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CurrentUserScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [InitialPage]
class InitialRoute extends PageRouteInfo<void> {
  const InitialRoute({List<PageRouteInfo>? children})
      : super(
          InitialRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const InitialPage();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [PersonalInformationScreen]
class PersonalInformationRoute
    extends PageRouteInfo<PersonalInformationRouteArgs> {
  PersonalInformationRoute({
    Key? key,
    UserEntity? user,
    List<PageRouteInfo>? children,
  }) : super(
          PersonalInformationRoute.name,
          args: PersonalInformationRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'PersonalInformationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PersonalInformationRouteArgs>(
          orElse: () => const PersonalInformationRouteArgs());
      return PersonalInformationScreen(
        key: args.key,
        user: args.user,
      );
    },
  );
}

class PersonalInformationRouteArgs {
  const PersonalInformationRouteArgs({
    this.key,
    this.user,
  });

  final Key? key;

  final UserEntity? user;

  @override
  String toString() {
    return 'PersonalInformationRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [RegistrationScreen]
class RegistrationRoute extends PageRouteInfo<void> {
  const RegistrationRoute({List<PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegistrationScreen();
    },
  );
}

/// generated route for
/// [RequestScreen]
class RequestRoute extends PageRouteInfo<void> {
  const RequestRoute({List<PageRouteInfo>? children})
      : super(
          RequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'RequestRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RequestScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}
