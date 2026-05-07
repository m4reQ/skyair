import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavbarButtonStyle {
  final Color backgroundColor;
  final Color foregroundColor;

  const NavbarButtonStyle({
    required this.backgroundColor,
    required this.foregroundColor,
  });
}

class NavbarButton extends StatelessWidget {
  final String imageSource;
  final NavbarButtonStyle style;
  final void Function()? onPressed;

  const NavbarButton({
    super.key,
    required this.style,
    required this.imageSource,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: const Color(0x00000000),
          backgroundColor: style.backgroundColor,
        ),
        onPressed: () => {onPressed?.call()},
        child: SvgPicture.asset(imageSource, color: style.foregroundColor),
      ),
    );
  }
}
