import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';

class AuthStyles {
  AuthStyles._();

  static const ink = Color(0xFF1C1631);
  static const body = Color(0xFF68627E);
  static const label = Color(0xFF2E2944);
  static const hint = Color(0xFF7D7891);
  static const link = Color(0xFF5B21B6);
  static const fieldBorder = Color(0xFFDDD5F2);
  static const lockedFill = Color(0xFFEFECF6);
  static const indicatorIdle = Color(0xFFDCD3F2);

  static TextStyle display({double size = 36, Color color = ink}) {
    return GoogleFonts.cormorantGaramond(
      fontSize: size,
      fontWeight: FontWeight.w700,
      height: 1.12,
      color: color,
    );
  }

  static const subtitle = TextStyle(fontSize: 15, height: 1.45, color: body);

  static const fieldLabel = TextStyle(
    fontSize: 13,
    height: 18 / 13,
    fontWeight: FontWeight.w500,
    color: label,
  );

  static const helper = TextStyle(fontSize: 12, height: 16 / 12, color: body);

  static const linkText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: link,
  );

  static const primary = AppColors.primary;
}
