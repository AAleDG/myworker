import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myworkers/core/router/router.dart';
import 'package:myworkers/core/utils/common_icon.dart';
import 'package:myworkers/features/splash/cubit/splash_cubit.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state.isTimePassed == true) {
          AutoRouter.of(context).replace(const InitialRoute());
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  AppIcon.iconSplash,
                  width: 350,
                  height: 350,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
