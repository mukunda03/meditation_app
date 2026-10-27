import 'package:flutter/material.dart';

/// The app icon as a rounded tile, as shown above the login heading.
class AppLogoTile extends StatelessWidget {
  const AppLogoTile({super.key, this.size = 56});

  final double size;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.29),
        boxShadow: const [
          BoxShadow(
            color: Color(0x266D28D9),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size * 0.29),
        child: Image.asset(
          'assets/branding/app_icon.png',
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
