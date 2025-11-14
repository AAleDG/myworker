import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myworkers/core/common_widgets/app_button.dart';
import 'package:myworkers/core/common_widgets/app_text.dart';
import 'package:myworkers/core/l10n/l10n_ext.dart';
import 'package:myworkers/core/router/router.dart';
import 'package:myworkers/features/firebase/auth_gate.dart';
import 'package:myworkers/features/supabase/supabase_google_sign_in.dart';

@RoutePage()
class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

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
                      AutoRouter.of(context).push(const LoginRoute());
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
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () async {
                       SupabaseGoogleSignIn.googleSignIn().then((value) {
                            AutoRouter.of(context).push(const HomeRoute());
                          });
                      // await GoogleSignInService.signInWithGoogle()
                      //     .then((value) {
                      //   AutoRouter.of(context).push(const HomeRoute());
                      // });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons_svg/google_icon.svg',
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        AppText(
                          context.l10nCore.loginTextWithGoogle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
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
