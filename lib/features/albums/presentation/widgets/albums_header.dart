import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';

class AlbumsHeader extends StatelessWidget {
  const AlbumsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'My Albums',
            style: GoogleFonts.sora(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              height: 32 / 24,
              letterSpacing: -0.6,
              color: AppColors.ink,
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0x0D000000),
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
              child: Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.78),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xCCE3E0F7)),
                ),
                child: SvgPicture.asset('assets/icons/history.svg'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
