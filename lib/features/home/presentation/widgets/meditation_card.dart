import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../data/home_data.dart';

class MeditationCard extends StatelessWidget {
  const MeditationCard({super.key, required this.item});

  final Meditation item;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: 160,
      radius: 16,
      padding: const EdgeInsets.all(11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Thumbnail(item: item),
          const SizedBox(height: 8),
          Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              height: 16 / 12,
              fontWeight: FontWeight.w700,
              color: AppColors.textHeading,
            ),
          ),
          Text(
            item.subtitle,
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: item.chipColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  item.duration,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: item.chipTextColor,
                  ),
                ),
              ),
              Container(
                width: 24,
                height: 24,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.dark,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1A000000),
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: SvgPicture.asset('assets/icons/play.svg'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Thumbnail extends StatelessWidget {
  const _Thumbnail({required this.item});

  final Meditation item;

  @override
  Widget build(BuildContext context) {
    final isOm = item.symbol == 'ॐ';

    return Container(
      height: 103,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: item.gradient,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.tag,
            style: TextStyle(
              fontSize: 7,
              height: 1.5,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.35,
              color: item.tagColor,
            ),
          ),
          Container(
            width: 64,
            height: 64,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: item.circleBorder),
              gradient: RadialGradient(
                center: const Alignment(-0.4, -0.4),
                radius: 1,
                colors: item.circleColors,
              ),
              boxShadow: [
                if (item.glow != null)
                  BoxShadow(color: item.glow!, blurRadius: isOm ? 12 : 15),
              ],
            ),
            child: item.icon != null
                ? SvgPicture.asset(item.icon!)
                : Text(
                    item.symbol!,
                    style: TextStyle(
                      fontSize: isOm ? 24 : 12,
                      color: isOm ? const Color(0xFFFCD34D) : Colors.white,
                    ),
                  ),
          ),
          Text(
            item.label,
            style: TextStyle(
              fontSize: 8,
              height: 1.5,
              fontWeight: FontWeight.w700,
              color: item.labelColor,
            ),
          ),
        ],
      ),
    );
  }
}
