import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/profile_data.dart';

class PracticeStatsRow extends StatelessWidget {
  const PracticeStatsRow({super.key, required this.stats});

  final List<PracticeStat> stats;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < stats.length; i++) ...[
          if (i > 0) const SizedBox(width: 10),
          Expanded(child: _StatCard(stat: stats[i])),
        ],
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.stat});

  final PracticeStat stat;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.8)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14713B9F),
            blurRadius: 32,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          SvgPicture.asset(stat.icon),
          const SizedBox(height: 4),
          Text(
            stat.value,
            style: GoogleFonts.sora(
              fontSize: 18,
              height: 28 / 18,
              letterSpacing: -0.45,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 2.5),
          Text(
            stat.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              height: 1,
              fontWeight: FontWeight.w500,
              color: Color(0xFF5E3282),
            ),
          ),
        ],
      ),
    );
  }
}
