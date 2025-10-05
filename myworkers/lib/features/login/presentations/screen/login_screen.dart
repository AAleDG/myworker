import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myworkers/core/l10n/l10n_ext.dart';
import 'package:myworkers/core/router/router.dart';
import 'package:myworkers/features/firebase/auth_gate.dart';
import 'package:myworkers/features/login/cubit/login_cubit.dart';

import '../../../../core/common_widgets/export_widgets.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LoginCubit>().initCubit();
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> keys = GlobalKey<FormState>();
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) => Form(
        key: keys,
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue[800]!,
                  Colors.red[800]!,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    AppText(
                      context.l10nCore.loginPageTitle,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AppTextField(
                      onChange: context.read<LoginCubit>().updateEmail,
                      controller: context.read<LoginCubit>().emailController,
                      hintText: context.l10nCore.loginPageEmailHint,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context
                              .l10nCore.loginPageHintTextErrorEmptyEmail;
                        } else if (!value.contains('@') ||
                            !value.contains('.')) {
                          return context.l10nCore.loginPageHintTextValidEmail;
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AppTextField(
                      onChange: context.read<LoginCubit>().updatePassword,
                      controller: context.read<LoginCubit>().passwordController,
                      hintText: context.l10nCore.loginPagePasswordHint,
                      obscureText: state.showPassword,
                      onPressed: context.read<LoginCubit>().toggleShowPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context
                              .l10nCore.loginPageHintTextErrorEmptyPassword;
                        } else if (value.length <= 8) {
                          return context
                              .l10nCore.loginPageHintTextValidPassword;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: state.rememberAccessData,
                          activeColor: Colors.blue,
                          side: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          onChanged: (_) {
                            context.read<LoginCubit>().updateDataaccess();
                          },
                        ),
                        AppText(
                          context.l10nCore.loginPageRememberMe,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AppButton(
                      onPressed: () {
                        if (keys.currentState!.validate()) {
                          if (GoogleSignInService.errorCode.isNotEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.white,
                                content: Text(
                                  GoogleSignInService.errorCode,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            );
                          }
                          GoogleSignInService.loginUser(
                                  state.email, state.password)
                              .then((value) {
                            AutoRouter.of(context).push(const HomeRoute());
                          });
                        }
                      },
                      textButton: context.l10nCore.loginPageAccessButtonText,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
