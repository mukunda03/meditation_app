import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../onboarding/presentation/screens/onboarding_screen.dart';
import '../../onboarding/providers/onboarding_providers.dart';
import '../../profile/providers/profile_providers.dart';
import '../../shell/presentation/main_shell.dart';
import '../providers/account_controller.dart';
import '../providers/auth_providers.dart';
import 'screens/complete_profile_screen.dart';
import 'screens/login_screen.dart';
import 'widgets/auth_scaffold.dart';
import 'widgets/auth_styles.dart';
import 'widgets/primary_button.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(currentUidProvider, (previous, next) {
      if (previous != next) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    });

    if (!ref.watch(onboardingSeenProvider)) return const OnboardingScreen();

    final auth = ref.watch(authStateProvider);
    if (auth.isLoading && !auth.hasValue) return const _Loading();
    final user = auth.value;
    if (user == null) return const LoginScreen();

    final profile = ref.watch(userProfileProvider);
    if (profile.isLoading) return const _Loading();
    if (profile.hasError) return const _ProfileLoadError();

    final data = profile.value;
    if (data == null || !data.profileCompleted) {
      return CompleteProfileScreen(email: user.email ?? '');
    }
    return const MainShell();
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return const AuthScaffold(
      child: Center(
        child: CircularProgressIndicator(color: AuthStyles.primary),
      ),
    );
  }
}

class _ProfileLoadError extends ConsumerWidget {
  const _ProfileLoadError();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AuthScaffold(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'We couldn\'t load your profile',
              textAlign: TextAlign.center,
              style: AuthStyles.display(size: 30),
            ),
            const SizedBox(height: 10),
            const Text(
              'Check your internet connection and try again.',
              textAlign: TextAlign.center,
              style: AuthStyles.subtitle,
            ),
            const SizedBox(height: 28),
            PrimaryButton(
              label: 'Try again',
              onPressed: () => ref.invalidate(userProfileProvider),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () =>
                  ref.read(accountControllerProvider.notifier).logOut(),
              style: TextButton.styleFrom(foregroundColor: AuthStyles.body),
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
