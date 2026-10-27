import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_snack_bar.dart';
import '../../providers/account_controller.dart';
import '../../providers/auth_form_providers.dart';
import '../widgets/auth_back_button.dart';
import '../widgets/auth_scaffold.dart';
import '../widgets/auth_styles.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/country_field.dart';
import '../widgets/date_of_birth_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/profile_photo_picker.dart';
import '../widgets/step_indicator.dart';

class CompleteProfileScreen extends ConsumerWidget {
  const CompleteProfileScreen({super.key, required this.email});

  final String email;

  Future<void> _continue(BuildContext context, WidgetRef ref) async {
    FocusScope.of(context).unfocus();
    if (!ref.read(completeProfileFormProvider.notifier).submit()) return;
    final result = await ref
        .read(accountControllerProvider.notifier)
        .completeProfile(ref.read(completeProfileFormProvider));
    if (result.hasError && context.mounted) {
      showErrorSnackBar(context, result.error);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(completeProfileFormProvider);
    final notifier = ref.read(completeProfileFormProvider.notifier);
    final isBusy = ref.watch(accountControllerProvider).isLoading;

    return AuthScaffold(
      child: FillViewportScroll(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AuthBackButton(
                onTap: isBusy
                    ? null
                    : () =>
                          ref.read(accountControllerProvider.notifier).logOut(),
              ),
              const StepIndicator(step: 2),
            ],
          ),
          const SizedBox(height: 28),
          Text('Complete your profile', style: AuthStyles.display()),
          const SizedBox(height: 10),
          const Text('Tell us a little about you.', style: AuthStyles.subtitle),
          const SizedBox(height: 24),
          Center(
            child: ProfilePhotoPicker(
              label: form.photoPath == null
                  ? 'Add profile photo'
                  : 'Change profile photo',
              imagePath: form.photoPath,
              onPicked: notifier.setPhotoPath,
            ),
          ),
          const SizedBox(height: 24),
          AuthTextField(
            label: 'Full name',
            hint: 'Your full name',
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.words,
            autofillHints: const [AutofillHints.name],
            onChanged: notifier.setName,
            errorText: form.nameError,
          ),
          const SizedBox(height: 20),
          DateOfBirthField(
            value: form.dateOfBirth,
            onChanged: notifier.setDateOfBirth,
            errorText: form.dateOfBirthError,
          ),
          const SizedBox(height: 20),
          CountryField(value: form.country, onChanged: notifier.setCountry),
          const SizedBox(height: 20),
          AuthTextField(
            label: 'Email',
            initialValue: email,
            locked: true,
            helper: 'Linked to your account, so it can\'t be changed.',
          ),
          const SizedBox(height: 28),
          const Spacer(),
          PrimaryButton(
            label: 'Continue',
            isLoading: isBusy,
            onPressed: () => _continue(context, ref),
          ),
        ],
      ),
    );
  }
}
