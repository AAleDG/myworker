import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myworkers/domain/user/user_entity.dart';
import 'package:myworkers/features/home/presentation/current_user_screen.dart';
import 'package:myworkers/features/home/presentation/home_screen.dart';
import 'package:myworkers/features/login/presentations/screen/initial_screen.dart';
import 'package:myworkers/features/login/presentations/screen/login_screen.dart';
import 'package:myworkers/features/persona_information/presentation/personal_information_screen.dart';
import 'package:myworkers/features/registration/presentations/registration_screen.dart';
import 'package:myworkers/features/requests/presentation/request_screen.dart';
import 'package:myworkers/features/splash/presentation/splash_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(page: RegistrationRoute.page),
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(page: InitialRoute.page, path: '/login'),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: PersonalInformationRoute.page),
        AutoRoute(page: RequestRoute.page),
        AutoRoute(page: CurrentUserRoute.page),
      ];
}
