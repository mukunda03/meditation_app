import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/profile_providers.dart';

class UserAvatar extends ConsumerWidget {
  const UserAvatar({super.key, required this.uid, required this.initials});

  final String uid;
  final String initials;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bytes = ref.watch(avatarProvider(uid)).value;
    if (bytes != null) {
      return Image.memory(bytes, fit: BoxFit.cover, gaplessPlayback: true);
    }
    return InitialsAvatar(initials: initials);
  }
}

class InitialsAvatar extends StatelessWidget {
  const InitialsAvatar({super.key, required this.initials});

  final String initials;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF7C3AED), Color(0xFFC0267D)],
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Center(
          child: Text(
            initials,
            style: TextStyle(
              fontSize: constraints.biggest.shortestSide * 0.33,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
