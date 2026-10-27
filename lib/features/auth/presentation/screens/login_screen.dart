import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shell/presentation/main_shell.dart';
import '../../providers/auth_form_providers.dart';
import '../widgets/app_logo_tile.dart';
import '../widgets/auth_footer_link.dart';
import '../widgets/auth_scaffold.dart';
import '../widgets/auth_styles.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/primary_button.dart';
import 'sign_up_screen.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  void _logIn(BuildContext context, WidgetRef ref) {
    FocusScope.of(context).unfocus();
    if (!ref.read(loginFormProvider.notifier).submit()) return;
    // TODO: authenticate with Firebase once the auth layer lands.
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const MainShell()),
      (_) => false,
    );
  }

  void _forgotPassword(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password reset is coming soon.')),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(loginFormProvider);
    final notifier = ref.read(loginFormProvider.notifier);

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
                onPressed: () => _forgotPassword(context),
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
