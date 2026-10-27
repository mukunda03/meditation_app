import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/glass_card.dart';

class FeaturedAlbumCard extends StatelessWidget {
  const FeaturedAlbumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(17),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _AlbumArt(),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3E8FF),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'Audio • 108 Repetitions',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: AppColors.purple,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '432 Hz',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Mantra OM: The Sound of Stillness',
                  style: TextStyle(
                    fontSize: 16,
                    height: 22 / 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Master Choa Kok Sui',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Offers a transformative journey through sacred universal sounds and vibrations.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    height: 19.5 / 12,
                    color: Color(0xFF475569),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.only(top: 9),
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Color(0xFFF1F5F9))),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 54, top: 12),
                        child: Text(
                          '32:45',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ),
                      _PlayButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AlbumArt extends StatelessWidget {
  const _AlbumArt();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112,
      height: 112,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x99DDD6FE)),
        gradient: const RadialGradient(
          radius: 0.78,
          colors: [
            Color(0x4DFDE047),
            Color(0x40F59470),
            Color(0x33EC4899),
            Color(0x99853272),
            Color(0xFF1E1B4B),
          ],
          stops: [0, 0.25, 0.5, 0.75, 1],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 6,
            spreadRadius: -1,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 3),
            child: Text(
              'MASTER CHOA KOK SUI',
              maxLines: 1,
              softWrap: false,
              style: TextStyle(
                fontSize: 7,
                height: 1.5,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.7,
                color: Color(0xE6FEF08A),
              ),
            ),
          ),
          Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.3),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0x99FCD34D)),
            ),
            child: const Text(
              'ॐ',
              style: TextStyle(fontSize: 20, color: Color(0xFFFDE68A)),
            ),
          ),
          const Text(
            'OM SOUND OF\nSTILLNESS',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 8,
              height: 1.5,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
              color: Color(0xFFFEF3C7),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Color(0xFF7C3AED), Color(0xFF4F46E5)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x408B5CF6),
            blurRadius: 6,
            spreadRadius: -1,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/play_white.svg'),
          const SizedBox(width: 6),
          const Text(
            'Play Now',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
