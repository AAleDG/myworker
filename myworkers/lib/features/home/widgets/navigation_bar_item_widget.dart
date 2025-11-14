import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationBarItemWidget extends StatelessWidget {
  final String iconPath;
  final bool isSelected;

  const NavigationBarItemWidget({
    super.key,
    required this.iconPath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      width: 30,
      height: 30,
      colorFilter: isSelected
          ? const ColorFilter.mode(
              Colors.blue,
              BlendMode.srcIn,
            )
          : const ColorFilter.mode(
              Colors.blueGrey,
              BlendMode.srcIn,
            ),
    );
  }
}
