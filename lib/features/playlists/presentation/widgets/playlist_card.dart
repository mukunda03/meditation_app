import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../data/playlists_data.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({super.key, required this.item});

  final Playlist item;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        children: [
          _StackedArt(item: item),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: item.tagColor,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: item.tagBorder),
                      ),
                      child: Text(
                        item.tag,
                        style: TextStyle(
                          fontSize: 9,
                          height: 13.5 / 9,
                          fontWeight: FontWeight.w700,
                          color: item.tagTextColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      item.meta,
                      style: const TextStyle(
                        fontSize: 11,
                        height: 16.5 / 11,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 20 / 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textHeading,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 16 / 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xFFFAF5FF),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(item.actionIcon),
          ),
        ],
      ),
    );
  }
}

class _StackedArt extends StatelessWidget {
  const _StackedArt({required this.item});

  final Playlist item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -4,
            right: -4,
            child: Opacity(
              opacity: 0.6,
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: item.backGradient,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 56,
            height: 56,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withValues(alpha: 0.8)),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: item.artGradient,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0D000000),
                  blurRadius: 1,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(item.icon),
                Text(
                  item.code,
                  style: const TextStyle(
                    fontSize: 9,
                    height: 13.5 / 9,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.45,
                    color: Color(0xFF334155),
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
