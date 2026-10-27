import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/sacred_lotus_emblem.dart';
import '../../shell/presentation/main_shell.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  );
  late final Animation<double> _emblem = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0, 0.7, curve: Curves.easeOutCubic),
  );
  late final Animation<double> _title = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.35, 1, curve: Curves.easeOut),
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
    Future.delayed(const Duration(milliseconds: 2600), _openApp);
  }

  void _openApp() {
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (_, _, _) => const MainShell(),
        transitionsBuilder: (_, animation, _, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lavender,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FadeTransition(
              opacity: _emblem,
              child: ScaleTransition(
                scale: Tween(begin: 0.85, end: 1.0).animate(_emblem),
                child: const SacredLotusEmblem(size: 220),
              ),
            ),
            const SizedBox(height: 28),
            FadeTransition(
              opacity: _title,
              child: SlideTransition(
                position: Tween(
                  begin: const Offset(0, 0.3),
                  end: Offset.zero,
                ).animate(_title),
                child: Column(
                  children: [
                    Text(
                      'PRANIC HEALING',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        height: 34 / 26,
                        letterSpacing: 2,
                        color: AppColors.ink,
                      ),
                    ),
                    const SizedBox(height: 6),
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [
                          AppColors.violet,
                          Color(0xFF7C3AED),
                          Color(0xFFA391FF),
                        ],
                      ).createShader(bounds),
                      child: Text(
                        'SANCTUARY',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sora(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 20 / 14,
                          letterSpacing: 8,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
