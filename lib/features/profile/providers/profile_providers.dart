import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/firebase_providers.dart';
import '../../auth/providers/auth_providers.dart';
import '../data/avatar_repository.dart';
import '../data/user_profile.dart';
import '../data/user_profile_repository.dart';

final userProfileRepositoryProvider = Provider<UserProfileRepository>(
  (ref) => UserProfileRepository(ref.watch(firestoreProvider)),
);

final avatarRepositoryProvider = Provider<AvatarRepository>(
  (ref) => AvatarRepository(ref.watch(firestoreProvider)),
);

final userProfileProvider = StreamProvider<UserProfile?>((ref) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream.value(null);
  return ref.watch(userProfileRepositoryProvider).watch(uid);
});

final avatarProvider = StreamProvider.autoDispose.family<Uint8List?, String>(
  (ref, uid) => ref.watch(avatarRepositoryProvider).watch(uid),
);
