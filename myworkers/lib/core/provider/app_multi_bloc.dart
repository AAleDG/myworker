import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myworkers/features/login/cubit/login_cubit.dart';
import 'package:myworkers/features/registration/cubit/registration_cubit.dart';

class AppMultiBlocProvider extends StatelessWidget {
  final Widget child;
  const AppMultiBlocProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegistrationCubit(),
        ),
      ],
      child: child,
    );
  }
}
