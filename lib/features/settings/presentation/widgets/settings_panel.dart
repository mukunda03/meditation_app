import 'package:flutter/material.dart';

class SettingsPanel extends StatelessWidget {
  const SettingsPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(1),
    this.borderColor = const Color(0xD9FFFFFF),
    this.boxShadow = const [
      BoxShadow(color: Color(0x146C5CE7), blurRadius: 32, offset: Offset(0, 8)),
    ],
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final List<BoxShadow> boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.78),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
