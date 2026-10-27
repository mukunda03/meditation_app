import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/albums_data.dart';
import '../widgets/album_filter_chips.dart';
import '../widgets/album_search_bar.dart';
import '../widgets/albums_header.dart';
import '../widgets/empty_sanctuary.dart';
import '../widgets/recommended_album_card.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 140),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: AlbumsHeader(),
          ),
          const SizedBox(height: 18),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: AlbumSearchBar(),
          ),
          const SizedBox(height: 8),
          const AlbumFilterChips(),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const EmptySanctuary(),
                const SizedBox(height: 8),
                const _RecommendedHeader(),
                for (final item in recommendedAlbums) ...[
                  const SizedBox(height: 10),
                  RecommendedAlbumCard(item: item),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RecommendedHeader extends StatelessWidget {
  const _RecommendedHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RECOMMENDED FOR YOUR PRACTICE',
                  style: GoogleFonts.sora(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    height: 16 / 12,
                    letterSpacing: 0.6,
                    color: AppColors.ink,
                  ),
                ),
                const Text(
                  'Pranic healing foundational essentials',
                  style: TextStyle(
                    fontSize: 11,
                    height: 16.5 / 11,
                    fontWeight: FontWeight.w500,
                    color: AppColors.inkMuted,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            'View All',
            style: TextStyle(
              fontSize: 11,
              height: 16.5 / 11,
              fontWeight: FontWeight.w600,
              color: AppColors.violet,
            ),
          ),
        ],
      ),
    );
  }
}
