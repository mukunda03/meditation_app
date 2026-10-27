import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/settings_data.dart';
import 'settings_panel.dart';

class SettingsGroupCard extends StatelessWidget {
  const SettingsGroupCard({super.key, required this.group});

  final SettingsGroup group;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            group.title,
            style: GoogleFonts.sora(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              height: 16.5 / 11,
              letterSpacing: 0.55,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        const SizedBox(height: 6),
        SettingsPanel(
          child: Column(
            children: [
              for (var i = 0; i < group.items.length; i++)
                _SettingsTile(item: group.items[i], showDivider: i > 0),
            ],
          ),
        ),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({required this.item, required this.showDivider});

  final SettingsItem item;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: showDivider
          ? const BoxDecoration(
              border: Border(top: BorderSide(color: Color(0xCCF1F5F9))),
            )
          : null,
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: item.iconBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(item.icon),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13.5,
                    height: 20.25 / 13.5,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (item.subtitle != null)
                  Text(
                    item.subtitle!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11.5,
                      height: 17.25 / 11.5,
                      color: AppColors.textSecondary,
                    ),
                  ),
              ],
            ),
          ),
          if (item.badge != null) ...[
            const SizedBox(width: 8),
            _CountBadge(label: item.badge!),
            const SizedBox(width: 8),
          ] else if (item.trailingText != null) ...[
            const SizedBox(width: 8),
            Text(
              item.trailingText!,
              style: const TextStyle(
                fontSize: 12,
                height: 16 / 12,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(width: 6),
          ] else
            const SizedBox(width: 8),
          SvgPicture.asset('assets/icons/settings_chevron.svg'),
        ],
      ),
    );
  }
}

class _CountBadge extends StatelessWidget {
  const _CountBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFFAF5FF),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0x99E9D5FF)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          height: 16.5 / 11,
          fontWeight: FontWeight.w600,
          color: Color(0xFF6C5CE7),
        ),
      ),
    );
  }
}
