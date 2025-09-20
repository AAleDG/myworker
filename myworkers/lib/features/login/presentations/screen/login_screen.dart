import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myworkers/core/common_widgets/app_button.dart';
import 'package:myworkers/core/common_widgets/app_text.dart';
import 'package:myworkers/core/l10n/l10n_ext.dart';
import 'package:myworkers/core/router/router.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
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
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    context.l10nCore.splashPageTitle,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AppButton(
                    onPressed: () {
                      AutoRouter.of(context).push(FeatRoute());
                    },
                    textButton: context.l10nCore.splashPageAccessButtonText,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AppButton(
                    onPressed: () {
                      AutoRouter.of(context).push(RegistrationRoute());
                    },
                    textButton: context.l10nCore.splashPageRegisterButtonText,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
