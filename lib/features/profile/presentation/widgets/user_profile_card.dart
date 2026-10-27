import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/profile_data.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({super.key, required this.user});

  final UserProfile user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _AuraAvatar(image: user.avatar),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      user.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.sora(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        height: 28 / 20,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  _CountryChip(label: user.country),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                user.email,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  height: 16 / 12,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 10),
              _TierBadge(label: user.tier),
            ],
          ),
        ),
      ],
    );
  }
}

class _AuraAvatar extends StatelessWidget {
  const _AuraAvatar({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xE6FFFFFF), Color(0x80E9DEF5)],
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x59BD96DE),
                blurRadius: 40,
                spreadRadius: -10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(image, fit: BoxFit.cover),
          ),
        ),
        // The badge SVG carries its own drop-shadow padding (24px around a
        // 20px dot), so it is offset to keep the dot at -4/-4.
        Positioned(
          right: -6,
          bottom: -7,
          child: SvgPicture.asset('assets/icons/profile_verified_badge.svg'),
        ),
      ],
    );
  }
}

class _CountryChip extends StatelessWidget {
  const _CountryChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFF3EEFA),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0x99E9DEF5)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 10,
          height: 15 / 10,
          fontWeight: FontWeight.w500,
          color: Color(0xFF5E3282),
        ),
      ),
    );
  }
}

class _TierBadge extends StatelessWidget {
  const _TierBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFF3EEFA)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(0xFF8B5CF6),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.cinzel(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                height: 16.5 / 11,
                letterSpacing: 0.275,
                color: const Color(0xFF4E2A6A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
