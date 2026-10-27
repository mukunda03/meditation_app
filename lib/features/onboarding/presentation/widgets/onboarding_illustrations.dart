import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

const _violet = Color(0xFF6D28D9);
const _magenta = Color(0xFFC0267D);

class _HaloDisc extends StatelessWidget {
  const _HaloDisc({required this.size, required this.child});

  final double size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF7E6F3), Color(0xFFEBE1F8)],
        ),
      ),
      child: child,
    );
  }
}

class SoundwaveIllustration extends StatelessWidget {
  const SoundwaveIllustration({super.key});

  static const _bars = [24.0, 44.0, 66.0, 44.0, 24.0];

  @override
  Widget build(BuildContext context) {
    return _HaloDisc(
      size: 282,
      child: Container(
        width: 220,
        height: 220,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF2D9EE), Color(0xFFE3D5F8)],
          ),
        ),
        child: Container(
          width: 158,
          height: 158,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < _bars.length; i++)
                Container(
                  width: 8,
                  height: _bars[i],
                  margin: const EdgeInsets.symmetric(horizontal: 4.5),
                  decoration: BoxDecoration(
                    color: i == 2 ? _magenta : _violet,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaylistStackIllustration extends StatelessWidget {
  const PlaylistStackIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return _HaloDisc(
      size: 282,
      child: SizedBox(
        width: 192,
        height: 160,
        child: Stack(
          children: [
            _ghostCard(left: 8, top: 0, opacity: 0.6),
            _ghostCard(left: 16, top: 52, opacity: 0.85),
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _NowPlayingCard(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ghostCard({
    required double left,
    required double top,
    required double opacity,
  }) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: 174,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: opacity),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}

class _NowPlayingCard extends StatelessWidget {
  const _NowPlayingCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x146D28D9),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 37,
            height: 37,
            decoration: BoxDecoration(
              color: _violet,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
              size: 26,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 7,
                  decoration: BoxDecoration(
                    color: AppColors.ink,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 9),
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(
                      color: const Color(0xFFC0B4DE),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 26,
            height: 26,
            decoration: const BoxDecoration(
              color: Color(0xFFFCE4EF),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.favorite_rounded,
              size: 14,
              color: _magenta,
            ),
          ),
        ],
      ),
    );
  }
}
