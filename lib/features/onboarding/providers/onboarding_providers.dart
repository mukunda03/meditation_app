import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/firebase_providers.dart';
import '../data/onboarding_repository.dart';

final onboardingRepositoryProvider = Provider<OnboardingRepository>(
  (ref) => OnboardingRepository(ref.watch(sharedPreferencesProvider)),
);

class OnboardingSeenNotifier extends Notifier<bool> {
  @override
  bool build() => ref.watch(onboardingRepositoryProvider).hasSeenOnboarding;

  Future<void> markSeen() async {
    state = true;
    await ref.read(onboardingRepositoryProvider).markSeen();
  }
}

final onboardingSeenProvider = NotifierProvider<OnboardingSeenNotifier, bool>(
  OnboardingSeenNotifier.new,
);
