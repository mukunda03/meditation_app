import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/profile_data.dart';

class ProfileTrackTile extends StatelessWidget {
  const ProfileTrackTile({super.key, required this.track});

  final ProfileTrack track;

  @override
  Widget build(BuildContext context) {
    final playing = track.isPlaying;

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: playing ? 0.8 : 0.7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: playing ? 1 : 0.9),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D5E3282),
            blurRadius: 20,
            spreadRadius: -2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          _TrackArt(track: track),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  track.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 20 / 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  track.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 16 / 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 6),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: track.meta,
                        style: playing
                            ? const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF894EBD),
                              )
                            : null,
                      ),
                      const TextSpan(text: '   •   '),
                      TextSpan(text: track.duration),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    height: 16.5 / 11,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _PlayButton(active: playing),
        ],
      ),
    );
  }
}

class _TrackArt extends StatelessWidget {
  const _TrackArt({required this.track});

  final ProfileTrack track;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: track.artGradient,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0D000000),
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: SvgPicture.asset(track.icon),
        ),
        if (track.isPlaying)
          const Positioned(top: -4, right: -4, child: _PlayingDot()),
      ],
    );
  }
}

/// Pulsing rose dot marking the track that is currently playing.
class _PlayingDot extends StatefulWidget {
  const _PlayingDot();

  @override
  State<_PlayingDot> createState() => _PlayingDotState();
}

class _PlayingDotState extends State<_PlayingDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 12,
      height: 12,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (_, _) => Transform.scale(
              scale: 1 + _controller.value,
              child: Opacity(
                opacity: 0.75 * (1 - _controller.value),
                child: const _Dot(color: Color(0xFFFB7185)),
              ),
            ),
          ),
          const _Dot(color: Color(0xFFF43F5E)),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.only(left: 4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: active ? const Color(0xFF894EBD) : const Color(0xFFF1F5F9),
        shape: BoxShape.circle,
        boxShadow: active
            ? const [
                BoxShadow(
                  color: Color(0x4D894EBD),
                  blurRadius: 6,
                  spreadRadius: -1,
                  offset: Offset(0, 4),
                ),
                BoxShadow(
                  color: Color(0x4D894EBD),
                  blurRadius: 4,
                  spreadRadius: -2,
                  offset: Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: SvgPicture.asset(
        active
            ? 'assets/icons/play_white_sm.svg'
            : 'assets/icons/play_dark_sm.svg',
      ),
    );
  }
}
