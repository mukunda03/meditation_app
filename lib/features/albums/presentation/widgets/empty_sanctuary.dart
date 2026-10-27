import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/sacred_lotus_emblem.dart';

class EmptySanctuary extends StatelessWidget {
  const EmptySanctuary({super.key, this.onExplore});

  final VoidCallback? onExplore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 16),
      child: Column(
        children: [
          const SacredLotusEmblem(),
          const SizedBox(height: 8),
          Text(
            'Your Sanctuary is Empty',
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              height: 28 / 20,
              letterSpacing: -0.5,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 6),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 285),
            child: const Text(
              "You haven't added any Master Choa Kok Sui meditation albums "
              'to your sacred library yet.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                height: 19.5 / 12,
                color: AppColors.inkSecondary,
              ),
            ),
          ),
          const SizedBox(height: 16),
          _ExploreButton(onTap: onExplore),
        ],
      ),
    );
  }
}

class _ExploreButton extends StatelessWidget {
  const _ExploreButton({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          gradient: const LinearGradient(
            colors: [AppColors.violet, Color(0xFF7C3AED), Color(0xFFA391FF)],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x4D5341CD),
              blurRadius: 6,
              spreadRadius: -1,
              offset: Offset(0, 4),
            ),
            BoxShadow(
              color: Color(0x4D5341CD),
              blurRadius: 4,
              spreadRadius: -2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'EXPLORE DISCOGRAPHY',
              style: TextStyle(
                fontSize: 12,
                height: 16 / 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.6,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset('assets/icons/arrow_right_white.svg'),
          ],
        ),
      ),
    );
  }
}
