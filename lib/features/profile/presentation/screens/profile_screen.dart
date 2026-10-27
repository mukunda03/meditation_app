import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../settings/presentation/screens/settings_screen.dart';
import '../../data/profile_data.dart';
import '../../providers/profile_providers.dart';
import '../widgets/daily_quote_pill.dart';
import '../widgets/practice_stats_row.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_tab_bar.dart';
import '../widgets/profile_track_tile.dart';
import '../widgets/user_profile_card.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  int _tab = 0;

  void _openSettings() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (_) => const SettingsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final tab = profileTabs[_tab];
    final user = ref.watch(userProfileProvider).value;

    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 140),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ProfileHeader(onMenuTap: _openSettings),
          ),
          if (user != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
              child: UserProfileCard(user: user),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const PracticeStatsRow(stats: practiceStats),
                const SizedBox(height: 24),
                ProfileTabBar(
                  labels: [for (final t in profileTabs) t.label],
                  selected: _tab,
                  onChanged: (index) => setState(() => _tab = index),
                ),
                const SizedBox(height: 16),
                _SectionTitle(title: tab.sectionTitle, count: tab.countLabel),
                for (final track in tab.tracks) ...[
                  const SizedBox(height: 12),
                  ProfileTrackTile(track: track),
                ],
                const SizedBox(height: 20),
                const DailyQuotePill(quote: dailyQuote),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, required this.count});

  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.cinzel(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                height: 16 / 12,
                letterSpacing: 0.6,
                color: AppColors.textMuted,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xB3F3EEFA),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              count,
              style: const TextStyle(
                fontSize: 11,
                height: 16.5 / 11,
                fontWeight: FontWeight.w500,
                color: Color(0xFF713B9F),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
