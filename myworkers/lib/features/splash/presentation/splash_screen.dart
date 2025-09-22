import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myworkers/core/router/router.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.wait([
        Future.delayed(const Duration(seconds: 2)),
      ]);
      AutoRouter.of(context).push(const LoginRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/icons_svg/logo_fronte2.svg',
                width: 350,
                height: 350,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
