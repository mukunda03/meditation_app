import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Frosted segmented control for Recently Played / Favorites / Downloads.
class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({
    super.key,
    required this.labels,
    required this.selected,
    required this.onChanged,
  });

  final List<String> labels;
  final int selected;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withValues(alpha: 0.8)),
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var i = 0; i < labels.length; i++)
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => onChanged(i),
                        child: _Tab(label: labels[i], active: i == selected),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({required this.label, required this.active});

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: active
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0D000000),
                  blurRadius: 1,
                  offset: Offset(0, 1),
                ),
              ],
            )
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (active) ...[
            Container(
              width: 4.89,
              height: 6,
              decoration: BoxDecoration(
                color: const Color(0xFF894EBD),
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            const SizedBox(width: 6),
          ],
          Flexible(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                height: 16 / 12,
                fontWeight: active ? FontWeight.w600 : FontWeight.w500,
                color: active
                    ? const Color(0xFF4E2A6A)
                    : AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
