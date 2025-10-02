import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myworkers/core/common_widgets/app_button.dart';
import 'package:myworkers/core/common_widgets/app_text.dart';
import 'package:myworkers/core/l10n/l10n_ext.dart';
import 'package:myworkers/core/router/router.dart';
import 'package:myworkers/features/firebase/auth_gate.dart';

@RoutePage()
class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //await AuthService.signInWithGoogleSilently();
    });
  }

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
                      AutoRouter.of(context).push(LoginRoute());
                    },
                    textButton: context.l10nCore.splashPageAccessButtonText,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AppButton(
                    onPressed: () {
                      AutoRouter.of(context).push(const RegistrationRoute());
                    },
                    textButton: context.l10nCore.splashPageRegisterButtonText,
                  ),
                  AppButton(
                    onPressed: () async{
                      await AuthService().signInWithGoogle();
                      //AutoRouter.of(context).push(const HomeRoute());
                    },
                    textButton: 'Accedi con Google',
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
