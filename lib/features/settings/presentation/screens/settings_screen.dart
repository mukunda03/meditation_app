import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../profile/data/profile_data.dart';
import '../../../profile/presentation/screens/edit_profile_screen.dart';
import '../../data/settings_data.dart';
import '../widgets/settings_group_card.dart';
import '../widgets/settings_header.dart';
import '../widgets/settings_panel.dart';
import '../widgets/user_identity_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lavender,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
          children: [
            SettingsHeader(onBack: () => Navigator.of(context).maybePop()),
            const SizedBox(height: 20),
            UserIdentityCard(
              user: currentUser,
              onEdit: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const EditProfileScreen(user: currentUser),
                ),
              ),
            ),
            const SizedBox(height: 20),
            for (final group in settingsGroups) ...[
              SettingsGroupCard(group: group),
              const SizedBox(height: 16),
            ],
            const _DeleteAccountCard(),
            const SizedBox(height: 28),
            const _LogoutButton(),
            const SizedBox(height: 19),
            const Text(
              appVersionLabel,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                height: 16.5 / 11,
                fontWeight: FontWeight.w500,
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              benediction,
              textAlign: TextAlign.center,
              style: GoogleFonts.lora(
                fontSize: 10,
                height: 15 / 10,
                fontStyle: FontStyle.italic,
                color: const Color(0x996C5CE7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeleteAccountCard extends StatelessWidget {
  const _DeleteAccountCard();

  @override
  Widget build(BuildContext context) {
    return SettingsPanel(
      padding: const EdgeInsets.all(5),
      borderColor: const Color(0xB3FEE2E2),
      boxShadow: const [
        BoxShadow(
          color: Color(0x0D000000),
          blurRadius: 2,
          offset: Offset(0, 1),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFFEF2F2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset('assets/icons/settings_trash.svg'),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Delete Account & Data',
                style: TextStyle(
                  fontSize: 12,
                  height: 16 / 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                  color: Color(0xFFEF4444),
                ),
              ),
            ),
            SvgPicture.asset('assets/icons/settings_chevron_red.svg'),
          ],
        ),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    return SettingsPanel(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
      borderColor: const Color(0xF2FFFFFF),
      boxShadow: const [
        BoxShadow(
          color: Color(0x1F8B5CF6),
          blurRadius: 36,
          spreadRadius: -4,
          offset: Offset(0, 12),
        ),
      ],
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0x1A6C5CE7),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset('assets/icons/settings_logout.svg'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'LOGOUT',
              style: GoogleFonts.sora(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 20 / 14,
                letterSpacing: 0.35,
                color: AppColors.textHeading,
              ),
            ),
          ),
          const Text(
            'End Session',
            style: TextStyle(
              fontSize: 12,
              height: 16 / 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(width: 6),
          SvgPicture.asset('assets/icons/settings_arrow_right.svg'),
        ],
      ),
    );
  }
}
