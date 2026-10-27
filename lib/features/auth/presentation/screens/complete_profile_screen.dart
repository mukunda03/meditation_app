import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shell/presentation/main_shell.dart';
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

/// Sign up, step 2 of 2: photo, name, date of birth and country.
class CompleteProfileScreen extends ConsumerWidget {
  const CompleteProfileScreen({super.key, required this.email});

  final String email;

  void _continue(BuildContext context, WidgetRef ref) {
    FocusScope.of(context).unfocus();
    if (!ref.read(completeProfileFormProvider.notifier).submit()) return;
    // TODO: save the profile to Firestore once the auth layer lands.
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const MainShell()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(completeProfileFormProvider);
    final notifier = ref.read(completeProfileFormProvider.notifier);

    return AuthScaffold(
      child: FillViewportScroll(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [AuthBackButton(), StepIndicator(step: 2)],
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
            onPressed: () => _continue(context, ref),
          ),
        ],
      ),
    );
  }
}
