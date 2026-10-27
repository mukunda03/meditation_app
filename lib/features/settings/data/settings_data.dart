import 'package:flutter/material.dart';

class SettingsItem {
  const SettingsItem({
    required this.title,
    required this.icon,
    required this.iconBackground,
    this.subtitle,
    this.badge,
    this.trailingText,
  });

  final String title;
  final String icon;
  final Color iconBackground;
  final String? subtitle;
  final String? badge;
  final String? trailingText;
}

class SettingsGroup {
  const SettingsGroup({required this.title, required this.items});

  final String title;
  final List<SettingsItem> items;
}

const settingsGroups = [
  SettingsGroup(
    title: 'PRACTICE & AUDIO',
    items: [
      SettingsItem(
        title: 'Audio Quality & Binaural Beats',
        subtitle: 'Hi-Res Lossless • 432 Hz',
        icon: 'assets/icons/settings_audio.svg',
        iconBackground: Color(0xCCEDE9FE),
      ),
      SettingsItem(
        title: 'Offline Sanctuary & Downloads',
        subtitle: '6 guided meditations available',
        icon: 'assets/icons/settings_download.svg',
        iconBackground: Color(0xCCF3E8FF),
      ),
      SettingsItem(
        title: 'Daily Sadhana Reminders',
        subtitle: 'Twin Hearts • 6:30 AM Daily',
        icon: 'assets/icons/settings_bell.svg',
        iconBackground: Color(0xCCFEF3C7),
      ),
    ],
  ),
  SettingsGroup(
    title: 'ACCOUNT & PREFERENCES',
    items: [
      SettingsItem(
        title: 'Wishlist & Sacred Bookmarks',
        icon: 'assets/icons/settings_heart.svg',
        iconBackground: Color(0xCCFCE7F3),
        badge: '12 saved',
      ),
      SettingsItem(
        title: 'Language / भाषा',
        icon: 'assets/icons/settings_language.svg',
        iconBackground: Color(0xCCE0F2FE),
        trailingText: 'English',
      ),
      SettingsItem(
        title: 'Security & Password',
        icon: 'assets/icons/settings_lock.svg',
        iconBackground: Color(0xCCE0E7FF),
      ),
    ],
  ),
  SettingsGroup(
    title: 'PRANIC HEALING TRUST & INFO',
    items: [
      SettingsItem(
        title: 'About Master Choa Kok Sui & Teachings',
        icon: 'assets/icons/settings_book.svg',
        iconBackground: Color(0xCCCCFBF1),
      ),
      SettingsItem(
        title: 'Global Meditation Centers',
        icon: 'assets/icons/settings_globe.svg',
        iconBackground: Color(0xCCD1FAE5),
      ),
      SettingsItem(
        title: 'Terms & Privacy Policy',
        icon: 'assets/icons/settings_docs.svg',
        iconBackground: Color(0xFFF1F5F9),
      ),
    ],
  ),
];

const appVersionLabel = 'Pranic Healing Sounds • v3.4.2 (2026)';
const benediction = 'Atma Namaste • Light and Love';
