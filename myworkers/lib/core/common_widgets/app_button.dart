import 'package:flutter/material.dart';
import 'package:myworkers/core/common_widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String textButton;
  const AppButton({
    super.key,
    required this.onPressed,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 15,
        ),
        backgroundColor: Colors.blue[800]!.withRed(130),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: AppText(
        textButton,
      ),
    );
  }
}
