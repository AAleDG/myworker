import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myworkers/core/l10n/l10n_ext.dart';
import 'package:myworkers/features/registration/cubit/registration_cubit.dart';

import '../../../core/common_widgets/export_widgets.dart';

@RoutePage()
class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> keys = GlobalKey<FormState>();
    return BlocBuilder<RegistrationCubit, RegistrationState>(
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
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    AppText(
                      context.l10nCore.registrationPageTitle,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AppTextField(
                      controller:
                          context.read<RegistrationCubit>().emailController,
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
                      controller:
                          context.read<RegistrationCubit>().nameController,
                      hintText: context.l10nCore.registrationPageHintName,
                      onPressed: () {},
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
                    AppTextField(
                      controller:
                          context.read<RegistrationCubit>().surnameController,
                      hintText: context.l10nCore.registrationPageHintSurname,
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
                      controller:
                          context.read<RegistrationCubit>().cfController,
                      hintText: context.l10nCore.registrationPageHintCF,
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
                      controller: context
                          .read<RegistrationCubit>()
                          .confirmPasswordController,
                      hintText: context.l10nCore.registrationPageHintGender,
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
                      controller:
                          context.read<RegistrationCubit>().phoneController,
                      hintText: context.l10nCore.registrationPageHintPhone,
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
                    //TODO TOGLIERE IL NUMERO DI CONFERMA ED FAR ARRIVARE AL TELEFONO DI ALE IL CODICE DI CONFERMA
                    AppTextField(
                      controller: context
                          .read<RegistrationCubit>()
                          .phoneConfirmController,
                      hintText:
                          context.l10nCore.registrationPageHintPhoneConfirm,
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
                    Row(
                      children: [
                        Checkbox(
                          value: state.showPassword,
                          activeColor: Colors.blue,
                          side: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          onChanged: (_) {
                            //context.read<LoginCubit>().updateDataaccess();
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
                          // context.read<LoginCubit>().checkStatus(
                          //       context,
                          //     );
                        }
                      },
                      textButton: 'Registrati',
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
