import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/app_colors.dart';
import '../../home/presentation/screens/home_screen.dart';
import '../../player/presentation/widgets/mini_player.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(-0.8, -0.7),
            radius: 2.8,
            colors: [
              Color(0xE6F3E8FF),
              Color(0xB3FEF2F2),
              Color(0xE6EEF2FF),
              AppColors.background,
            ],
            stops: [0, 0.35, 0.7, 1],
          ),
        ),
        child: const Stack(
          children: [
            HomeScreen(),
            Positioned(
              left: 16,
              right: 16,
              bottom: 0,
              child: SafeArea(
                top: false,
                minimum: EdgeInsets.only(bottom: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [MiniPlayer(), SizedBox(height: 4), _BottomDock()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomDock extends StatelessWidget {
  const _BottomDock();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F4F46E5),
            blurRadius: 40,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 9),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white.withValues(alpha: 0.8)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _NavItem(
                  icon: 'assets/icons/nav_home.svg',
                  label: 'Home',
                  active: true,
                ),
                _NavItem(
                  icon: 'assets/icons/nav_albums.svg',
                  label: 'My Albums',
                ),
                _NavItem(
                  icon: 'assets/icons/nav_playlists.svg',
                  label: 'PlayLists',
                ),
                _NavItem(
                  icon: 'assets/icons/nav_profile.svg',
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    this.active = false,
  });

  final String icon;
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(icon),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            letterSpacing: -0.25,
            fontWeight: active ? FontWeight.w600 : FontWeight.w400,
            color: active ? AppColors.primary : AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}
