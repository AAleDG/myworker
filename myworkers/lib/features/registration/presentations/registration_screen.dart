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
      builder: (context, state) {
        if (state.isAwaitingConfirmation) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Check your email',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'We sent a confirmation link. Please open it to continue.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => context
                          .read<RegistrationCubit>()
                          .checkConfirmationNow(context),
                      child: const Text("I've confirmed"),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        // TODO: implement resend confirmation (depends on Supabase policy)
                      },
                      child: const Text('Resend email'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return Form(
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
                        onChange: context.read<RegistrationCubit>().updateEmail,
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
                        onChange: context.read<RegistrationCubit>().updateName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return context.l10nCore.registrationNameErrorEmpty;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      AppTextField(
                        onChange:
                            context.read<RegistrationCubit>().updateSurname,
                        controller:
                            context.read<RegistrationCubit>().surnameController,
                        hintText: context.l10nCore.registrationPageHintSurname,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return context
                                .l10nCore.registrationSurnameErrorEmpty;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      AppTextField(
                        onChange: context.read<RegistrationCubit>().updateCF,
                        controller:
                            context.read<RegistrationCubit>().cfController,
                        hintText: context.l10nCore.registrationPageHintCF,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return context.l10nCore.registrationCFErrorEmpty;
                          } else if (value.length != 16) {
                            return context.l10nCore.registrationCFValidError;
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      AppTextField(
                        onChange:
                            context.read<RegistrationCubit>().updateGender,
                        controller:
                            context.read<RegistrationCubit>().genderController,
                        hintText: context.l10nCore.registrationPageHintGender,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return context
                                .l10nCore.registrationGenderErrorEmpty;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      AppTextField(
                        onChange: context.read<RegistrationCubit>().updatePhone,
                        controller:
                            context.read<RegistrationCubit>().phoneController,
                        hintText: context.l10nCore.registrationPageHintPhone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return context.l10nCore.registrationPhoneErrorEmpty;
                          } else if (value.length < 10) {
                            return context
                                .l10nCore.registrationPhoneLengthError;
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //TODO TOGLIERE IL NUMERO DI CONFERMA ED FAR ARRIVARE AL TELEFONO DI ALE IL CODICE DI CONFERMA
                      AppButton(
                        onPressed: () {
                          context.read<RegistrationCubit>().checkStatus(
                                context,
                                keys.currentState!.validate(),
                              );
                        },
                        textButton:
                            context.l10nCore.splashPageRegisterButtonText,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
