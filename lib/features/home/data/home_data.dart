import 'package:flutter/material.dart';

class Meditation {
  const Meditation({
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.tag,
    required this.label,
    required this.gradient,
    required this.tagColor,
    required this.labelColor,
    required this.chipColor,
    required this.chipTextColor,
    required this.circleColors,
    required this.circleBorder,
    this.glow,
    this.icon,
    this.symbol,
  });

  final String title;
  final String subtitle;
  final String duration;
  final String tag;
  final String label;
  final List<Color> gradient;
  final Color tagColor;
  final Color labelColor;
  final Color chipColor;
  final Color chipTextColor;
  final List<Color> circleColors;
  final Color circleBorder;
  final Color? glow;
  final String? icon;
  final String? symbol;
}

const meditations = [
  Meditation(
    title: 'Meditation on Twin Hearts',
    subtitle: 'Master Choa Kok Sui',
    duration: '21 min',
    tag: 'PEACE & ILLUMINATION',
    label: 'Twin Hearts',
    gradient: [Color(0xFF38BDF8), Color(0xFF4F46E5), Color(0xFF020617)],
    tagColor: Color(0xFFE0F2FE),
    labelColor: Color(0xFFFDE68A),
    chipColor: Color(0xFFF5F3FF),
    chipTextColor: Color(0xFF6D28D9),
    circleColors: [Color(0xFF38BDF8), Color(0xFF1D4ED8), Color(0xFF0F172A)],
    circleBorder: Color(0x66FFFFFF),
    glow: Color(0xB338BDF8),
    icon: 'assets/icons/globe.svg',
  ),
  Meditation(
    title: 'शांति एवं प्रकाश के लिए',
    subtitle: 'Hindi Meditation',
    duration: '24 min',
    tag: 'मास्टर चोआ कॉक सुई',
    label: 'हृदय ध्यान',
    gradient: [Color(0xFFCFFAFE), Color(0xFF7DD3FC), Color(0xFF3730A3)],
    tagColor: Color(0xFF334155),
    labelColor: Colors.white,
    chipColor: Color(0xFFECFDF5),
    chipTextColor: Color(0xFF047857),
    circleColors: [Color(0xFF7DD3FC), Color(0xFF0284C7), Color(0xFF1E3A8A)],
    circleBorder: Colors.white,
    glow: Color(0x800EA5E9),
    symbol: 'शांति',
  ),
  Meditation(
    title: 'Om: Sound of Stillness',
    subtitle: 'Universal Purifier',
    duration: '32 min',
    tag: 'CHANT MANTRA',
    label: 'Sound of Stillness',
    gradient: [Color(0xFF1E1B4B), Color(0xFF581C87), Color(0xFF0F172A)],
    tagColor: Color(0xFFFEF08A),
    labelColor: Color(0xFFFDE68A),
    chipColor: Color(0xFFFAF5FF),
    chipTextColor: Color(0xFF7E22CE),
    circleColors: [Color(0x992E1065), Color(0x992E1065)],
    circleBorder: Color(0x66FDE047),
    glow: Color(0x4DEAB308),
    symbol: 'ॐ',
  ),
  Meditation(
    title: 'Arhatic Kundalini Fire',
    subtitle: 'Master Choa Kok Sui',
    duration: '45 min',
    tag: 'KUNDALINI ALIGNMENT',
    label: 'Sacred Fire',
    gradient: [Color(0xFF581C87), Color(0xFF312E81), Color(0xFF4C0519)],
    tagColor: Color(0xFFFECDD3),
    labelColor: Color(0xFFFECDD3),
    chipColor: Color(0xFFFFF1F2),
    chipTextColor: Color(0xFFBE123C),
    circleColors: [Color(0x66000000), Color(0x66000000)],
    circleBorder: Color(0x66FDA4AF),
    icon: 'assets/icons/fire.svg',
  ),
];
