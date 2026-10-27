import 'package:flutter/material.dart';

class PracticeStat {
  const PracticeStat({
    required this.value,
    required this.label,
    required this.icon,
  });

  final String value;
  final String label;
  final String icon;
}

class ProfileTrack {
  const ProfileTrack({
    required this.title,
    required this.subtitle,
    required this.meta,
    required this.duration,
    required this.icon,
    required this.artGradient,
    this.isPlaying = false,
  });

  final String title;
  final String subtitle;
  final String meta;
  final String duration;
  final String icon;
  final List<Color> artGradient;
  final bool isPlaying;
}

class ProfileTab {
  const ProfileTab({
    required this.label,
    required this.sectionTitle,
    required this.countLabel,
    required this.tracks,
  });

  final String label;
  final String sectionTitle;
  final String countLabel;
  final List<ProfileTrack> tracks;
}

const practitionerTier = 'Arhatic Practitioner • Level 1';

const practiceStats = [
  PracticeStat(
    value: '128',
    label: 'Hours Meditated',
    icon: 'assets/icons/stat_clock.svg',
  ),
  PracticeStat(
    value: '45',
    label: 'Day Streak',
    icon: 'assets/icons/stat_flame.svg',
  ),
  PracticeStat(
    value: '24',
    label: 'Sacred Tracks',
    icon: 'assets/icons/stat_heart.svg',
  ),
];

const _violetArt = [Color(0xFF894EBD), Color(0xFFA78BFA)];
const _amberArt = [Color(0xFFFBBF24), Color(0xFFFB7185)];
const _cyanArt = [Color(0xFF22D3EE), Color(0xFFBD96DE)];

const profileTabs = [
  ProfileTab(
    label: 'Recently Played',
    sectionTitle: 'RECENT MEDITATIONS',
    countLabel: '3 Spiritual Sessions',
    tracks: [
      ProfileTrack(
        title: 'Meditation on Twin Hearts',
        subtitle: 'Master Choa Kok Sui',
        meta: 'Played 21m ago',
        duration: '24 mins',
        icon: 'assets/icons/track_mandala.svg',
        artGradient: _violetArt,
        isPlaying: true,
      ),
      ProfileTrack(
        title: 'Om Namah Shivaya Chanting',
        subtitle: 'Sacred Resonance Mantra',
        meta: 'Yesterday',
        duration: '18 mins',
        icon: 'assets/icons/track_om.svg',
        artGradient: _amberArt,
      ),
      ProfileTrack(
        title: 'Aura Cleansing Affirmation',
        subtitle: 'Chakra Balance Guidance',
        meta: '3 days ago',
        duration: '15 mins',
        icon: 'assets/icons/track_star.svg',
        artGradient: _cyanArt,
      ),
    ],
  ),
  ProfileTab(
    label: 'Favorites',
    sectionTitle: 'FAVORITE MEDITATIONS',
    countLabel: '4 Saved Blessings',
    tracks: [
      ProfileTrack(
        title: 'Meditation on Twin Hearts',
        subtitle: 'Master Choa Kok Sui',
        meta: 'Played 12 times',
        duration: '24 mins',
        icon: 'assets/icons/track_mandala.svg',
        artGradient: _violetArt,
      ),
      ProfileTrack(
        title: 'Meditation on the Soul',
        subtitle: 'Oneness with the Higher Soul',
        meta: 'Played 8 times',
        duration: '32 mins',
        icon: 'assets/icons/track_star.svg',
        artGradient: _cyanArt,
      ),
      ProfileTrack(
        title: 'Great Invocation',
        subtitle: 'Sacred Prayer of Light',
        meta: 'Played 6 times',
        duration: '9 mins',
        icon: 'assets/icons/track_om.svg',
        artGradient: _amberArt,
      ),
      ProfileTrack(
        title: 'Forgiveness Meditation',
        subtitle: 'Healing the Heart Chakra',
        meta: 'Played 4 times',
        duration: '20 mins',
        icon: 'assets/icons/track_mandala.svg',
        artGradient: _violetArt,
      ),
    ],
  ),
  ProfileTab(
    label: 'Downloads',
    sectionTitle: 'OFFLINE SANCTUARY',
    countLabel: '2 Downloaded',
    tracks: [
      ProfileTrack(
        title: 'Om Namah Shivaya Chanting',
        subtitle: 'Sacred Resonance Mantra',
        meta: '42 MB',
        duration: '18 mins',
        icon: 'assets/icons/track_om.svg',
        artGradient: _amberArt,
      ),
      ProfileTrack(
        title: 'Aura Cleansing Affirmation',
        subtitle: 'Chakra Balance Guidance',
        meta: '35 MB',
        duration: '15 mins',
        icon: 'assets/icons/track_star.svg',
        artGradient: _cyanArt,
      ),
    ],
  ),
];

const dailyQuote =
    '"When you do Meditation on Twin Hearts, divine energy flows into you, '
    'blessing the entire earth."';
