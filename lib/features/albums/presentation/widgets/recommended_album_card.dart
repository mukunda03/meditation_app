import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/albums_data.dart';

class RecommendedAlbumCard extends StatelessWidget {
  const RecommendedAlbumCard({super.key, required this.item});

  final RecommendedAlbum item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D5341CD),
            blurRadius: 20,
            spreadRadius: -2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
          child: Container(
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.78),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xCCE3E0F7)),
            ),
            child: Row(
              children: [
                _CoverArt(item: item),
                const SizedBox(width: 12),
                Expanded(child: _Metadata(item: item)),
                const SizedBox(width: 12),
                const _QuickAddButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CoverArt extends StatelessWidget {
  const _CoverArt({required this.item});

  final RecommendedAlbum item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(48),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: item.coverGradient,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(11),
        child: ColoredBox(
          color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: item.glowTopRight ? -12 : null,
                right: item.glowTopRight ? -12 : null,
                bottom: item.glowTopRight ? null : -8,
                left: item.glowTopRight ? null : -8,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: item.glowColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              SvgPicture.asset(item.icon),
            ],
          ),
        ),
      ),
    );
  }
}

class _Metadata extends StatelessWidget {
  const _Metadata({required this.item});

  final RecommendedAlbum item;

  static const _metaStyle = TextStyle(
    fontSize: 10,
    height: 15 / 10,
    fontWeight: FontWeight.w500,
    color: AppColors.inkMuted,
  );
  static const _dotStyle = TextStyle(
    fontSize: 10,
    height: 15 / 10,
    color: AppColors.inkMuted,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                item.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  height: 16 / 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                  color: AppColors.ink,
                ),
              ),
            ),
            if (item.isNew) ...[
              const SizedBox(width: 6),
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFF14B8A6),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 1),
        Text(
          item.subtitle,
          style: const TextStyle(
            fontSize: 11,
            height: 16.5 / 11,
            color: AppColors.inkSecondary,
          ),
        ),
        const SizedBox(height: 4),
        Wrap(
          spacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/icons/music_note.svg'),
                const SizedBox(width: 4),
                Text(item.tracks, style: _metaStyle),
              ],
            ),
            const Text('•', style: _dotStyle),
            Text(item.duration, style: _metaStyle),
            const Text('•', style: _dotStyle),
            Text(
              item.category,
              style: _metaStyle.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.violet,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _QuickAddButton extends StatelessWidget {
  const _QuickAddButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0x99E8E6FC),
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0x66C8C4D7)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: SvgPicture.asset('assets/icons/plus_violet.svg'),
    );
  }
}
