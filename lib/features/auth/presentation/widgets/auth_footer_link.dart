import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'auth_styles.dart';

class AuthFooterLink extends StatelessWidget {
  const AuthFooterLink({
    super.key,
    required this.prompt,
    required this.action,
    required this.onTap,
  });

  final String prompt;
  final String action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: const TextStyle(fontSize: 14, color: AuthStyles.body),
        children: [
          TextSpan(text: '$prompt '),
          TextSpan(
            text: action,
            style: AuthStyles.linkText,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
