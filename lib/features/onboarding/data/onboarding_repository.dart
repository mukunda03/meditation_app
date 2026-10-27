import 'package:shared_preferences/shared_preferences.dart';

class OnboardingRepository {
  OnboardingRepository(this._prefs);

  final SharedPreferences _prefs;

  static const _seenKey = 'onboarding_seen';

  bool get hasSeenOnboarding => _prefs.getBool(_seenKey) ?? false;

  Future<void> markSeen() => _prefs.setBool(_seenKey, true);
}
