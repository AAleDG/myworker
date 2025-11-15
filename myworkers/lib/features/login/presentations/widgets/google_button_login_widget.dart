import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myworkers/core/common_widgets/app_text.dart';
import 'package:myworkers/core/l10n/l10n.dart';
import 'package:myworkers/core/utils/common_icon.dart';

class GoogleButtonLoginWidget extends StatelessWidget {
  const GoogleButtonLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppIcon.googleIcon,
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
    );
  }
}
