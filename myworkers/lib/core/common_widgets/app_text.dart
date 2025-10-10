import 'package:flutter/material.dart';
import 'package:myworkers/core/utils/common_style.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final int? maxLines;

  const AppText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.textDirection,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines ?? 1,
      textDirection: textDirection ?? TextDirection.ltr,
      style: style ??
          CommonTextStyle.standard,
    );
  }
}
