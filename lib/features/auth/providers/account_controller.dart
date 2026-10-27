import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../profile/data/user_profile.dart';
import '../../profile/providers/profile_providers.dart';
import 'auth_form_providers.dart';
import 'auth_providers.dart';

class AccountController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<AsyncValue<void>> _run(Future<void> Function() action) async {
    state = const AsyncLoading();
    final result = await AsyncValue.guard(action);
    if (ref.mounted) state = result;
    return result;
  }

  Future<AsyncValue<void>> logIn(String email, String password) {
    return _run(
      () => ref
          .read(authRepositoryProvider)
          .logIn(email: email.trim(), password: password),
    );
  }

  Future<AsyncValue<void>> signUp(String email, String password) {
    return _run(
      () => ref
          .read(authRepositoryProvider)
          .signUp(email: email.trim(), password: password),
    );
  }

  Future<AsyncValue<void>> sendPasswordReset(String email) {
    return _run(
      () => ref.read(authRepositoryProvider).sendPasswordReset(email.trim()),
    );
  }

  Future<AsyncValue<void>> logOut() {
    return _run(() => ref.read(authRepositoryProvider).logOut());
  }

  Future<AsyncValue<void>> completeProfile(ProfileFormState form) {
    return _run(() async {
      final user = ref.read(authRepositoryProvider).currentUser!;
      if (form.photoPath != null) {
        await ref
            .read(avatarRepositoryProvider)
            .upload(uid: user.uid, filePath: form.photoPath!);
      }
      await ref
          .read(userProfileRepositoryProvider)
          .create(
            UserProfile(
              uid: user.uid,
              email: user.email ?? '',
              fullName: form.name.trim(),
              dateOfBirth: form.dateOfBirth,
              countryCode: form.country.countryCode,
              countryName: form.country.name,
              profileCompleted: true,
            ),
          );
    });
  }

  Future<AsyncValue<void>> saveProfile(ProfileFormState form) {
    return _run(() async {
      final uid = ref.read(authRepositoryProvider).currentUser!.uid;
      if (form.photoPath != null) {
        await ref
            .read(avatarRepositoryProvider)
            .upload(uid: uid, filePath: form.photoPath!);
      }
      await ref
          .read(userProfileRepositoryProvider)
          .update(
            uid: uid,
            fullName: form.name.trim(),
            dateOfBirth: form.dateOfBirth,
            countryCode: form.country.countryCode,
            countryName: form.country.name,
          );
    });
  }

  Future<AsyncValue<void>> deleteAccount(String password) {
    return _run(() async {
      final auth = ref.read(authRepositoryProvider);
      final uid = auth.currentUser!.uid;
      await auth.reauthenticate(password);
      await ref.read(avatarRepositoryProvider).delete(uid);
      await ref.read(userProfileRepositoryProvider).delete(uid);
      await auth.deleteUser();
    });
  }
}

final accountControllerProvider =
    AsyncNotifierProvider<AccountController, void>(AccountController.new);
