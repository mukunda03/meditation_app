import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SacredLotusEmblem extends StatelessWidget {
  const SacredLotusEmblem({super.key, this.size = 176});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: const FittedBox(child: _Emblem()),
    );
  }
}

class _Emblem extends StatelessWidget {
  const _Emblem();

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 176,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0x265341CD),
                      Color(0x33FDA4AF),
                      Color(0x40A391FF),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Positioned.fill(
            left: 8,
            top: 8,
            right: 8,
            bottom: 8,
            child: CustomPaint(painter: _DashedCirclePainter()),
          ),
          Positioned.fill(
            left: 20,
            top: 20,
            right: 20,
            bottom: 20,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0x336C5CE7)),
              ),
            ),
          ),
          const _Medallion(),
          const Positioned(
            right: 28,
            top: 16,
            child: _Glyph(color: Color(0x995341CD)),
          ),
          const Positioned(
            left: 32,
            bottom: 24,
            child: _Glyph(color: Color(0xB3FB7185)),
          ),
        ],
      ),
    );
  }
}

class _Medallion extends StatelessWidget {
  const _Medallion();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112,
      height: 112,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color(0x1A5341CD),
            blurRadius: 15,
            spreadRadius: -3,
            offset: Offset(0, 10),
          ),
          BoxShadow(
            color: Color(0x1A5341CD),
            blurRadius: 6,
            spreadRadius: -4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset('assets/icons/app_logo.svg'),
      ),
    );
  }
}

class _Glyph extends StatelessWidget {
  const _Glyph({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      '✦',
      style: TextStyle(fontSize: 12, height: 16 / 12, color: color),
    );
  }
}

class _DashedCirclePainter extends CustomPainter {
  const _DashedCirclePainter();

  static const _dash = 3.0;
  static const _gap = 3.0;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.shortestSide / 2 - 0.5;
    final center = size.center(Offset.zero);
    final paint = Paint()
      ..color = const Color(0x405341CD)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final circumference = 2 * math.pi * radius;
    final count = (circumference / (_dash + _gap)).floor();
    final step = 2 * math.pi / count;
    final sweep = step * _dash / (_dash + _gap);
    final rect = Rect.fromCircle(center: center, radius: radius);
    for (var i = 0; i < count; i++) {
      canvas.drawArc(rect, i * step, sweep, false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
