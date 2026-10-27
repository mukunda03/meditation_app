import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';

class AlbumSearchBar extends StatelessWidget {
  const AlbumSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color(0x99C8C4D7)),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        style: const TextStyle(fontSize: 14, color: AppColors.ink),
        cursorColor: AppColors.violet,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.8),
          hintText: 'Search chants, mantras, sutras...',
          hintStyle: const TextStyle(fontSize: 14, color: AppColors.textMuted),
          contentPadding: const EdgeInsets.fromLTRB(0, 13, 17, 13),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 14, right: 12),
            child: SvgPicture.asset('assets/icons/search_violet.svg'),
          ),
          prefixIconConstraints: const BoxConstraints(),
          border: border,
          enabledBorder: border,
          focusedBorder: border.copyWith(
            borderSide: const BorderSide(color: AppColors.violet),
          ),
        ),
      ),
    );
  }
}
