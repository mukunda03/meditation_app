import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'auth_styles.dart';

class ProfilePhotoPicker extends StatelessWidget {
  const ProfilePhotoPicker({
    super.key,
    required this.label,
    required this.onPicked,
    this.imagePath,
    this.current,
    this.size = 104,
  });

  final String label;
  final ValueChanged<String> onPicked;
  final String? imagePath;
  final Widget? current;
  final double size;

  Future<void> _pick(BuildContext context) async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => const _SourceSheet(),
    );
    if (source == null) return;

    try {
      final file = await ImagePicker().pickImage(
        source: source,
        maxWidth: 1024,
        imageQuality: 85,
        preferredCameraDevice: CameraDevice.front,
      );
      if (file != null) onPicked(file.path);
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Couldn\'t open your photos. Check app permissions.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const badge = 44.0;
    return Column(
      children: [
        Semantics(
          button: true,
          label: label,
          child: GestureDetector(
            onTap: () => _pick(context),
            child: SizedBox.square(
              dimension: size + badge / 3,
              child: Stack(
                children: [
                  SizedBox.square(dimension: size, child: _avatar()),
                  const Positioned(right: 0, bottom: 0, child: _CameraBadge()),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => _pick(context),
          child: Text(label, style: AuthStyles.linkText.copyWith(fontSize: 15)),
        ),
      ],
    );
  }

  Widget _avatar() {
    if (imagePath != null) {
      return ClipOval(child: Image.file(File(imagePath!), fit: BoxFit.cover));
    }
    if (current != null) return ClipOval(child: current);
    return CustomPaint(
      painter: const _DashedCirclePainter(),
      child: const DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xFFFBF9FE),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.person_outline_rounded,
            size: 34,
            color: AuthStyles.primary,
          ),
        ),
      ),
    );
  }
}

class _CameraBadge extends StatelessWidget {
  const _CameraBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: AuthStyles.primary,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: const [
          BoxShadow(
            color: Color(0x406D28D9),
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: const Icon(
        Icons.photo_camera_outlined,
        size: 20,
        color: Colors.white,
      ),
    );
  }
}

class _SourceSheet extends StatelessWidget {
  const _SourceSheet();

  @override
  Widget build(BuildContext context) {
    Widget option(IconData icon, String text, ImageSource source) {
      return ListTile(
        leading: Icon(icon, color: AuthStyles.primary),
        title: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AuthStyles.ink,
          ),
        ),
        onTap: () => Navigator.of(context).pop(source),
      );
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: AuthStyles.indicatorIdle,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            option(
              Icons.photo_camera_outlined,
              'Take a photo',
              ImageSource.camera,
            ),
            option(
              Icons.photo_library_outlined,
              'Choose from gallery',
              ImageSource.gallery,
            ),
          ],
        ),
      ),
    );
  }
}

class _DashedCirclePainter extends CustomPainter {
  const _DashedCirclePainter();

  static const _dash = 6.0;
  static const _gap = 5.0;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.shortestSide / 2 - 1;
    final rect = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: radius,
    );
    final paint = Paint()
      ..color = const Color(0xFFB9A2EC)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final count = (2 * math.pi * radius / (_dash + _gap)).floor();
    final step = 2 * math.pi / count;
    final sweep = step * _dash / (_dash + _gap);
    for (var i = 0; i < count; i++) {
      canvas.drawArc(rect, i * step, sweep, false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
