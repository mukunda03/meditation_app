import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class WisdomBanner extends StatefulWidget {
  const WisdomBanner({super.key});

  @override
  State<WisdomBanner> createState() => _WisdomBannerState();
}

class _WisdomBannerState extends State<WisdomBanner> {
  static const pageCount = 3;
  static const pageGap = 12.0;

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 191,
          // widen the PageView by the gap so cards keep full width
          // but show space between them while swiping
          child: LayoutBuilder(
            builder: (_, constraints) => OverflowBox(
              minWidth: constraints.maxWidth + pageGap,
              maxWidth: constraints.maxWidth + pageGap,
              child: PageView.builder(
                itemCount: pageCount,
                onPageChanged: (index) => setState(() => currentPage = index),
                itemBuilder: (_, _) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: pageGap / 2),
                  child: _BannerCard(),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        _Dots(count: pageCount, current: currentPage),
      ],
    );
  }
}

class _BannerCard extends StatelessWidget {
  const _BannerCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0x33818CF8)),
        gradient: const LinearGradient(
          begin: Alignment(-0.5, -1),
          end: Alignment(0.5, 1),
          colors: [Color(0xFF312E81), Color(0xFF1E293B), Color(0xFF581C87)],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(23),
        child: Stack(
          children: [
            const Positioned(
              top: -48,
              right: -48,
              child: _Glow(
                size: 176,
                blur: 20,
                colors: [Color(0x4DA855F7), Color(0x33F43F5E)],
              ),
            ),
            const Positioned(
              bottom: -40,
              left: -40,
              child: _Glow(
                size: 144,
                blur: 12,
                colors: [Color(0x4D3B82F6), Color(0x1A6366F1)],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              width: 192,
              child: Opacity(
                opacity: 0.15,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 86,
                      top: 28,
                      child: SvgPicture.asset('assets/icons/geometry_1.svg'),
                    ),
                    Positioned(
                      left: 107,
                      top: 49,
                      child: SvgPicture.asset('assets/icons/geometry_2.svg'),
                    ),
                    Positioned(
                      left: 114,
                      top: 38,
                      child: SvgPicture.asset('assets/icons/geometry_3.svg'),
                    ),
                    Positioned(
                      left: 114,
                      top: 66,
                      child: SvgPicture.asset('assets/icons/geometry_4.svg'),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(24), child: _BannerContent()),
          ],
        ),
      ),
    );
  }
}

class _BannerContent extends StatelessWidget {
  const _BannerContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/icons/sparkle.svg'),
            const SizedBox(width: 6),
            const Expanded(
              child: Text(
                'DAILY ARHATIC WISDOM',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.55,
                  color: Color(0xFFE9D5FF),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(999),
              ),
              child: const Text(
                'Sutra 108',
                style: TextStyle(fontSize: 10, color: Color(0xFFE2E8F0)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 11),
        Text(
          '"Arhatic Yoga consists of yogic techniques designed to help us develop spiritually. It is prehistoric in origin."',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.outfit(
            fontSize: 14,
            height: 22.75 / 14,
            letterSpacing: 0.35,
            color: const Color(0xF2EEF2FF),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.only(top: 9),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '— Master Choa Kok Sui',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.6,
                  color: Color(0xE6FDE68A),
                ),
              ),
              Row(
                children: [
                  const Text(
                    'Deep Contemplation',
                    style: TextStyle(fontSize: 11, color: Color(0xFFE9D5FF)),
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset('assets/icons/arrow_up_right.svg'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Glow extends StatelessWidget {
  const _Glow({required this.size, required this.blur, required this.colors});

  final double size;
  final double blur;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({required this.count, required this.current});

  final int count;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < count; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: i == current ? 20 : 6,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              color: i == current ? null : const Color(0xCCCBD5E1),
              gradient: i == current
                  ? const LinearGradient(
                      colors: [Color(0xFF9333EA), Color(0xFFEC4899)],
                    )
                  : null,
            ),
          ),
      ],
    );
  }
}
