import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/albums_data.dart';

class AlbumFilterChips extends StatefulWidget {
  const AlbumFilterChips({super.key});

  @override
  State<AlbumFilterChips> createState() => _AlbumFilterChipsState();
}

class _AlbumFilterChipsState extends State<AlbumFilterChips> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
        itemCount: albumFilters.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (_, index) => Center(
          child: _FilterChip(
            label: albumFilters[index],
            selected: index == _selected,
            onTap: () => setState(() => _selected = index),
          ),
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
        padding: selected
            ? const EdgeInsets.symmetric(horizontal: 16, vertical: 6)
            : const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.violet
              : Colors.white.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(999),
          border: selected ? null : Border.all(color: const Color(0x80C8C4D7)),
          boxShadow: selected
              ? const [
                  BoxShadow(
                    color: Color(0x405341CD),
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
            fontWeight: FontWeight.w500,
            color: selected ? Colors.white : AppColors.inkSecondary,
          ),
        ),
      ),
    );
  }
}
