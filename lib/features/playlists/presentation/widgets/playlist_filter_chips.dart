import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/playlists_data.dart';

class PlaylistFilterChips extends StatefulWidget {
  const PlaylistFilterChips({super.key});

  @override
  State<PlaylistFilterChips> createState() => _PlaylistFilterChipsState();
}

class _PlaylistFilterChipsState extends State<PlaylistFilterChips> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
        itemCount: playlistFilters.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (_, index) => _FilterChip(
          label: playlistFilters[index],
          selected: index == _selected,
          onTap: () => setState(() => _selected = index),
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected
              ? AppColors.dark
              : Colors.white.withValues(alpha: 0.55),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: selected
                ? AppColors.dark
                : Colors.white.withValues(alpha: 0.7),
          ),
          boxShadow: selected
              ? const [
                  BoxShadow(
                    color: Color(0x0D000000),
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            height: 16 / 12,
            color: selected ? Colors.white : const Color(0xFF475569),
          ),
        ),
      ),
    );
  }
}
