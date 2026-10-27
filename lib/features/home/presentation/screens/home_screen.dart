import 'package:flutter/material.dart';

import '../../data/home_data.dart';
import '../widgets/featured_album_card.dart';
import '../widgets/home_header.dart';
import '../widgets/meditation_card.dart';
import '../widgets/section_header.dart';
import '../widgets/wisdom_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.only(top: 4, bottom: 160),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                HomeHeader(),
                SizedBox(height: 24),
                WisdomBanner(),
                SizedBox(height: 24),
                SectionHeader(
                  icon: 'assets/icons/album.svg',
                  title: 'FEATURED ALBUM',
                  action: 'View Liner Notes',
                  titleColor: Color(0xFF334155),
                ),
                SizedBox(height: 12),
                FeaturedAlbumCard(),
                SizedBox(height: 28),
                SectionHeader(
                  icon: 'assets/icons/heart.svg',
                  title: 'POPULAR MEDITATIONS',
                  subtitle: 'Most played global collective sessions',
                  action: 'See All',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 251,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
              itemCount: meditations.length,
              separatorBuilder: (_, _) => const SizedBox(width: 16),
              itemBuilder: (_, index) =>
                  MeditationCard(item: meditations[index]),
            ),
          ),
        ],
      ),
    );
  }
}
