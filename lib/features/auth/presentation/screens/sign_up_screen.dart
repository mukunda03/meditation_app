import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_snack_bar.dart';
import '../../providers/account_controller.dart';
import '../../providers/auth_form_providers.dart';
import '../widgets/auth_back_button.dart';
import '../widgets/auth_footer_link.dart';
import '../widgets/auth_scaffold.dart';
import '../widgets/auth_styles.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/step_indicator.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  Future<void> _createAccount(BuildContext context, WidgetRef ref) async {
    FocusScope.of(context).unfocus();
    if (!ref.read(signUpFormProvider.notifier).submit()) return;
    final form = ref.read(signUpFormProvider);
    final result = await ref
        .read(accountControllerProvider.notifier)
        .signUp(form.email, form.password);
    if (result.hasError && context.mounted) {
      showErrorSnackBar(context, result.error);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(signUpFormProvider);
    final notifier = ref.read(signUpFormProvider.notifier);
    final isBusy = ref.watch(accountControllerProvider).isLoading;

    return AuthScaffold(
      child: FillViewportScroll(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [AuthBackButton(), StepIndicator(step: 1)],
          ),
          const SizedBox(height: 28),
          Text('Create your account', style: AuthStyles.display()),
          const SizedBox(height: 10),
          const Text(
            'Start with your email and a password. You\'ll set up your '
            'profile next.',
            style: AuthStyles.subtitle,
          ),
          const SizedBox(height: 32),
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
            hint: 'Create a password',
            helper: 'At least 8 characters, with one number.',
            obscureText: form.obscured,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.newPassword],
            onChanged: notifier.setPassword,
            errorText: form.passwordError,
            suffix: PasswordVisibilityToggle(
              obscured: form.obscured,
              onToggle: notifier.toggleObscured,
            ),
          ),
          const SizedBox(height: 20),
          AuthTextField(
            label: 'Confirm password',
            hint: 'Re-enter your password',
            obscureText: form.obscuredConfirm,
            textInputAction: TextInputAction.done,
            onChanged: notifier.setConfirmPassword,
            errorText: form.confirmError,
            suffix: PasswordVisibilityToggle(
              obscured: form.obscuredConfirm,
              onToggle: notifier.toggleObscuredConfirm,
            ),
          ),
          const SizedBox(height: 20),
          _TermsCheckbox(
            value: form.agreedToTerms,
            errorText: form.termsError,
            onChanged: notifier.setAgreedToTerms,
          ),
          const SizedBox(height: 20),
          PrimaryButton(
            label: 'Create account',
            isLoading: isBusy,
            onPressed: () => _createAccount(context, ref),
          ),
          const Spacer(),
          const SizedBox(height: 32),
          AuthFooterLink(
            prompt: 'Already have an account?',
            action: 'Log in',
            onTap: () => Navigator.of(context).maybePop(),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _TermsCheckbox extends StatelessWidget {
  const _TermsCheckbox({
    required this.value,
    required this.onChanged,
    this.errorText,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final error = Theme.of(context).colorScheme.error;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => onChanged(!value),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                SizedBox.square(
                  dimension: 24,
                  child: Checkbox(
                    value: value,
                    onChanged: (v) => onChanged(v ?? false),
                    activeColor: AuthStyles.primary,
                    side: BorderSide(
                      color: errorText != null ? error : AuthStyles.body,
                      width: 1.4,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'I agree to the Terms and Privacy Policy',
                    style: TextStyle(fontSize: 14, color: AuthStyles.body),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 36),
            child: Text(
              errorText!,
              style: TextStyle(fontSize: 12, color: error),
            ),
          ),
      ],
    );
  }
}
