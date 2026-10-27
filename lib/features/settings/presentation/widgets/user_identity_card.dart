import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../profile/data/profile_data.dart';
import 'settings_panel.dart';

class UserIdentityCard extends StatelessWidget {
  const UserIdentityCard({super.key, required this.user});

  final UserProfile user;

  @override
  Widget build(BuildContext context) {
    return SettingsPanel(
      padding: EdgeInsets.zero,
      borderColor: const Color(0xE6FFFFFF),
      child: Stack(
        children: [
          // Ambient glow tucked into the top-right corner.
          Positioned(
            top: -32,
            right: -32,
            child: Container(
              width: 96,
              height: 96,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0x268B5CF6),
                    Color(0x26EC4899),
                    Color(0x00EC4899),
                  ],
                ),
                boxShadow: [
                  BoxShadow(color: Color(0x1AEC4899), blurRadius: 24),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _StatusAvatar(image: user.avatar),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 24 / 16,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        user.email,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          height: 16 / 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 14),
                const _EditPill(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusAvatar extends StatelessWidget {
  const _StatusAvatar({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 56,
          height: 56,
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0x406C5CE7),
                blurRadius: 24,
                spreadRadius: -2,
              ),
            ],
          ),
          child: ClipOval(child: Image.asset(image, fit: BoxFit.cover)),
        ),
        Positioned(
          right: -2,
          bottom: -2,
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: const Color(0xFF34D399),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}

class _EditPill extends StatelessWidget {
  const _EditPill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.82),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xB3E9D5FF)),
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
          const Text(
            'Edit',
            style: TextStyle(
              fontSize: 12,
              height: 16 / 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6C5CE7),
            ),
          ),
          const SizedBox(width: 4),
          SvgPicture.asset('assets/icons/settings_edit_chevron.svg'),
        ],
      ),
    );
  }
}
