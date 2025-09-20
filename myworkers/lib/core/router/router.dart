import 'package:auto_route/auto_route.dart';
import 'package:myworkers/features/login/presentations/screen/feat_page.dart';
import 'package:myworkers/features/login/presentations/screen/login_screen.dart';
import 'package:myworkers/features/registration/presentations/registration_screen.dart';
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
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: FeatRoute.page),
      ];
}
