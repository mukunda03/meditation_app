import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/app_colors.dart';
import '../../albums/presentation/screens/albums_screen.dart';
import '../../home/presentation/screens/home_screen.dart';
import '../../player/presentation/widgets/mini_player.dart';
import '../../playlists/presentation/screens/playlists_screen.dart';

const _homeTab = 0;
const _albumsTab = 1;
const _playlistsTab = 2;

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = _homeTab;

  void _onTabSelected(int index) {
    // Profile is not built yet.
    if (index == _homeTab || index == _albumsTab || index == _playlistsTab) {
      setState(() => _index = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isHome = _index == _homeTab;

    return Scaffold(
      body: Container(
        decoration: isHome
            ? const BoxDecoration(
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
              )
            : const BoxDecoration(color: AppColors.lavender),
        child: Stack(
          children: [
            switch (_index) {
              _albumsTab => const AlbumsScreen(),
              _playlistsTab => const PlaylistsScreen(),
              _ => const HomeScreen(),
            },
            Positioned(
              left: 16,
              right: 16,
              bottom: 0,
              child: SafeArea(
                top: false,
                minimum: const EdgeInsets.only(bottom: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isHome) ...[
                      const MiniPlayer(),
                      const SizedBox(height: 4),
                      _BottomDock(index: _index, onTap: _onTabSelected),
                    ] else if (_index == _albumsTab)
                      _AlbumsDock(index: _index, onTap: _onTabSelected)
                    else
                      _PillDock(index: _index, onTap: _onTabSelected),
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

class _BottomDock extends StatelessWidget {
  const _BottomDock({required this.index, required this.onTap});

  final int index;
  final ValueChanged<int> onTap;

  static const _icons = [
    'assets/icons/nav_home.svg',
    'assets/icons/nav_albums.svg',
    'assets/icons/nav_playlists.svg',
    'assets/icons/nav_profile.svg',
  ];

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var i = 0; i < _navLabels.length; i++)
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => onTap(i),
                    child: _NavItem(
                      icon: _icons[i],
                      label: _navLabels[i],
                      active: i == index,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const _navLabels = ['Home', 'My Albums', 'PlayLists', 'Profile'];

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

/// Floating pill dock used by the My Albums tab.
class _AlbumsDock extends StatelessWidget {
  const _AlbumsDock({required this.index, required this.onTap});

  final int index;
  final ValueChanged<int> onTap;

  static const _icons = [
    'assets/icons/albums_dock_home.svg',
    'assets/icons/albums_dock_albums_active.svg',
    'assets/icons/albums_dock_playlists.svg',
    'assets/icons/albums_dock_profile.svg',
  ];
  static const _labels = ['Home', 'My Albums', 'Playlists', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 390),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F5341CD),
            blurRadius: 36,
            spreadRadius: -4,
            offset: Offset(0, 16),
          ),
          BoxShadow(color: Color(0x146C5CE7), blurRadius: 1, spreadRadius: 1),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(999),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 11),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.88),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: Colors.white.withValues(alpha: 0.95)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var i = 0; i < _labels.length; i++)
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => onTap(i),
                    child: _AlbumsNavItem(
                      icon: _icons[i],
                      label: _labels[i],
                      active: i == index,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AlbumsNavItem extends StatelessWidget {
  const _AlbumsNavItem({
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
        if (active)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SvgPicture.asset(icon),
                Positioned(
                  top: -2,
                  right: -3.67,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: AppColors.violet,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.white, spreadRadius: 2),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        else
          SvgPicture.asset(icon),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            height: 15 / 10,
            letterSpacing: -0.25,
            fontWeight: active ? FontWeight.w700 : FontWeight.w500,
            color: active ? AppColors.violet : AppColors.inkSecondary,
          ),
        ),
      ],
    );
  }
}

/// Floating pill dock used by the Playlists tab.
class _PillDock extends StatelessWidget {
  const _PillDock({required this.index, required this.onTap});

  final int index;
  final ValueChanged<int> onTap;

  static const _icons = [
    'assets/icons/dock_home.svg',
    'assets/icons/dock_albums.svg',
    'assets/icons/dock_playlists_active.svg',
    'assets/icons/dock_profile.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 384),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 50,
            spreadRadius: -12,
            offset: Offset(0, 25),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(999),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.65),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: Colors.white.withValues(alpha: 0.9)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var i = 0; i < _navLabels.length; i++)
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => onTap(i),
                    child: _PillNavItem(
                      icon: _icons[i],
                      label: _navLabels[i],
                      active: i == index,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PillNavItem extends StatelessWidget {
  const _PillNavItem({
    required this.icon,
    required this.label,
    this.active = false,
  });

  final String icon;
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: active ? 14 : 12,
            vertical: 4,
          ),
          decoration: active
              ? BoxDecoration(
                  color: const Color(0x1A9333EA),
                  borderRadius: BorderRadius.circular(999),
                )
              : null,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 17,
                child: Center(child: SvgPicture.asset(icon)),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  height: 15 / 10,
                  letterSpacing: -0.25,
                  fontWeight: active ? FontWeight.w700 : FontWeight.w400,
                  color: active ? const Color(0xFF581C87) : AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
        if (active)
          Positioned(
            top: -2,
            child: Container(
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: Color(0xFF9333EA),
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}
