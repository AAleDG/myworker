import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myworkers/core/l10n/l10n_ext.dart';
import 'package:myworkers/features/login/cubit/login_cubit.dart';

import '../../../../core/common_widgets/export_widgets.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                          context.read<LoginCubit>().checkStatus(
                                context,
                              );
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
