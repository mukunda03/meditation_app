import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.onMenuTap});

  final VoidCallback onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'My Profile',
            style: GoogleFonts.sora(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              height: 32 / 24,
              letterSpacing: -0.6,
              color: AppColors.ink,
            ),
          ),
        ),
        GestureDetector(
          onTap: onMenuTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0D000000),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.6),
                    ),
                  ),
                  child: SvgPicture.asset('assets/icons/profile_menu.svg'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
