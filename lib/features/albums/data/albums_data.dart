import 'package:flutter/material.dart';

class RecommendedAlbum {
  const RecommendedAlbum({
    required this.title,
    required this.subtitle,
    required this.tracks,
    required this.duration,
    required this.category,
    required this.icon,
    required this.coverGradient,
    required this.glowColor,
    required this.glowTopRight,
    this.isNew = false,
  });

  final String title;
  final String subtitle;
  final String tracks;
  final String duration;
  final String category;
  final String icon;
  final List<Color> coverGradient;
  final Color glowColor;
  final bool glowTopRight;
  final bool isNew;
}

const albumFilters = [
  'All Albums',
  'Downloaded',
  'Favorites',
  'Chants',
  'Meditations',
];

const recommendedAlbums = [
  RecommendedAlbum(
    title: 'Meditation on Twin Hearts',
    subtitle: 'Grand Master Choa Kok Sui',
    tracks: '2 Tracks',
    duration: '28 Mins',
    category: 'Illumination',
    icon: 'assets/icons/heart_amber.svg',
    coverGradient: [Color(0xFFFEF3C7), Color(0xFFFFE4E6), Color(0xFFE9D5FF)],
    glowColor: Color(0x40FCD34D),
    glowTopRight: true,
    isNew: true,
  ),
  RecommendedAlbum(
    title: 'Meditation on the Soul',
    subtitle: 'Achieving Oneness with Higher Soul',
    tracks: '3 Tracks',
    duration: '45 Mins',
    category: 'Chakra Energy',
    icon: 'assets/icons/eye_teal.svg',
    coverGradient: [Color(0xFFCCFBF1), Color(0xFFE0E7FF), Color(0xFFE9D5FF)],
    glowColor: Color(0x405EEAD4),
    glowTopRight: false,
  ),
];
