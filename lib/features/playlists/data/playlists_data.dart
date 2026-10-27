import 'package:flutter/material.dart';

class Playlist {
  const Playlist({
    required this.title,
    required this.subtitle,
    required this.meta,
    required this.tag,
    required this.code,
    required this.icon,
    required this.actionIcon,
    required this.artGradient,
    required this.backGradient,
    required this.tagColor,
    required this.tagBorder,
    required this.tagTextColor,
  });

  final String title;
  final String subtitle;
  final String meta;
  final String tag;
  final String code;
  final String icon;
  final String actionIcon;
  final List<Color> artGradient;
  final List<Color> backGradient;
  final Color tagColor;
  final Color tagBorder;
  final Color tagTextColor;
}

const playlistFilters = ['Recent', 'Created', 'Most Played', 'Sacred OM'];

const playlists = [
  Playlist(
    title: 'Daily Twin Hearts Routine',
    subtitle: 'Physical Exercises, Meditation & Blessings',
    meta: '• 42 mins',
    tag: 'Morning',
    code: 'TH-01',
    icon: 'assets/icons/sun.svg',
    actionIcon: 'assets/icons/play_purple.svg',
    artGradient: [Color(0xFFFEF3C7), Color(0xFFFFE4E6), Color(0xFFDDD6FE)],
    backGradient: [Color(0xFFE9D5FF), Color(0xFFE0E7FF)],
    tagColor: Color(0xFFFFFBEB),
    tagBorder: Color(0x80FDE68A),
    tagTextColor: Color(0xFFB45309),
  ),
  Playlist(
    title: 'Evening Aura Cleansing & OM',
    subtitle: '108 OM Chants with Tibetan Singing Bowls',
    meta: '• 5 tracks • 1h 10m',
    tag: 'Dusk',
    code: 'AURA',
    icon: 'assets/icons/moon.svg',
    actionIcon: 'assets/icons/shuffle.svg',
    artGradient: [Color(0xFFE0E7FF), Color(0xFFF3E8FF), Color(0xFFFCE7F3)],
    backGradient: [Color(0xFF99F6E4), Color(0xFFBAE6FD)],
    tagColor: Color(0xFFEEF2FF),
    tagBorder: Color(0x80C7D2FE),
    tagTextColor: Color(0xFF4338CA),
  ),
  Playlist(
    title: 'Arhatic Dhyan & Kundalini',
    subtitle: 'Spiritual Cord Affirmation & Blue Pearl',
    meta: '• 4 tracks • 55 mins',
    tag: 'Advanced',
    code: 'YOGA',
    icon: 'assets/icons/lotus.svg',
    actionIcon: 'assets/icons/play_purple.svg',
    artGradient: [Color(0xFFFFE4E6), Color(0xFFF3E8FF), Color(0xFFFFFBEB)],
    backGradient: [Color(0xFFFDE68A), Color(0xFFFECDD3)],
    tagColor: Color(0xFFFFF1F2),
    tagBorder: Color(0x80FECDD3),
    tagTextColor: Color(0xFFBE123C),
  ),
];
