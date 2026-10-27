import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_snack_bar.dart';
import '../../providers/account_controller.dart';
import '../../providers/auth_form_providers.dart';
import '../auth_validators.dart';
import '../widgets/app_logo_tile.dart';
import '../widgets/auth_footer_link.dart';
import '../widgets/auth_scaffold.dart';
import '../widgets/auth_styles.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/primary_button.dart';
import 'sign_up_screen.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  Future<void> _logIn(BuildContext context, WidgetRef ref) async {
    FocusScope.of(context).unfocus();
    if (!ref.read(loginFormProvider.notifier).submit()) return;
    final form = ref.read(loginFormProvider);
    final result = await ref
        .read(accountControllerProvider.notifier)
        .logIn(form.email, form.password);
    if (result.hasError && context.mounted) {
      showErrorSnackBar(context, result.error);
    }
  }

  Future<void> _forgotPassword(BuildContext context, WidgetRef ref) async {
    final email = ref.read(loginFormProvider).email.trim();
    if (AuthValidators.email(email) != null) {
      showAppSnackBar(context, 'Enter your email above, then tap this again.');
      return;
    }
    final result = await ref
        .read(accountControllerProvider.notifier)
        .sendPasswordReset(email);
    if (!context.mounted) return;
    if (result.hasError) {
      showErrorSnackBar(context, result.error);
    } else {
      showAppSnackBar(
        context,
        "If an account exists for $email, we've sent a reset link.",
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(loginFormProvider);
    final notifier = ref.read(loginFormProvider.notifier);
    final isBusy = ref.watch(accountControllerProvider).isLoading;

    return AuthScaffold(
      child: AutofillGroup(
        child: FillViewportScroll(
          padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
          children: [
            const Align(alignment: Alignment.centerLeft, child: AppLogoTile()),
            const SizedBox(height: 32),
            Text('Welcome back', style: AuthStyles.display(size: 38)),
            const SizedBox(height: 10),
            const Text(
              'Log in to continue your daily sadhana.',
              style: AuthStyles.subtitle,
            ),
            const SizedBox(height: 40),
            AuthTextField(
              label: 'Email',
              hint: 'you@example.com',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.email],
              onChanged: notifier.setEmail,
              errorText: form.emailError,
            ),
            const SizedBox(height: 20),
            AuthTextField(
              label: 'Password',
              hint: 'Enter your password',
              obscureText: form.obscured,
              textInputAction: TextInputAction.done,
              autofillHints: const [AutofillHints.password],
              onChanged: notifier.setPassword,
              errorText: form.passwordError,
              suffix: PasswordVisibilityToggle(
                obscured: form.obscured,
                onToggle: notifier.toggleObscured,
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: isBusy ? null : () => _forgotPassword(context, ref),
                style: TextButton.styleFrom(
                  foregroundColor: AuthStyles.link,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  textStyle: AuthStyles.linkText.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: const Text('Forgot password?'),
              ),
            ),
            const SizedBox(height: 12),
            PrimaryButton(
              label: 'Log in',
              isLoading: isBusy,
              onPressed: () => _logIn(context, ref),
            ),
            const Spacer(),
            const SizedBox(height: 32),
            AuthFooterLink(
              prompt: 'New to Pranic Healing Sounds?',
              action: 'Create account',
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const SignUpScreen())),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
