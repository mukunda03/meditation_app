import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/widgets/auth_back_button.dart';
import '../../../auth/presentation/widgets/auth_scaffold.dart';
import '../../../auth/presentation/widgets/auth_styles.dart';
import '../../../auth/presentation/widgets/auth_text_field.dart';
import '../../../auth/presentation/widgets/country_field.dart';
import '../../../auth/presentation/widgets/date_of_birth_field.dart';
import '../../../auth/presentation/widgets/primary_button.dart';
import '../../../auth/presentation/widgets/profile_photo_picker.dart';
import '../../../auth/providers/auth_form_providers.dart';
import '../../data/profile_data.dart';

class EditProfileScreen extends ConsumerWidget {
  const EditProfileScreen({super.key, required this.user});

  final UserProfile user;

  void _save(BuildContext context, WidgetRef ref) {
    FocusScope.of(context).unfocus();
    if (!ref.read(editProfileFormProvider.notifier).submit()) return;
    // TODO: persist the profile once the auth layer lands.
    final messenger = ScaffoldMessenger.of(context);
    Navigator.of(context).pop();
    messenger.showSnackBar(
      const SnackBar(content: Text('Your profile has been updated.')),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(editProfileFormProvider);
    final notifier = ref.read(editProfileFormProvider.notifier);

    return AuthScaffold(
      child: FillViewportScroll(
        children: [
          const Stack(
            alignment: Alignment.center,
            children: [
              Align(alignment: Alignment.centerLeft, child: AuthBackButton()),
              Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AuthStyles.ink,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: ProfilePhotoPicker(
              label: 'Change photo',
              size: 96,
              imagePath: form.photoPath,
              initials: form.initials,
              onPicked: notifier.setPhotoPath,
            ),
          ),
          const SizedBox(height: 24),
          AuthTextField(
            label: 'Full name',
            initialValue: form.name,
            hint: 'Your full name',
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.words,
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
            initialValue: user.email,
            locked: true,
            helper: 'Email can\'t be changed.',
          ),
          const SizedBox(height: 32),
          const Spacer(),
          PrimaryButton(
            label: 'Save changes',
            onPressed: () => _save(context, ref),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => Navigator.of(context).maybePop(),
            style: TextButton.styleFrom(
              foregroundColor: AuthStyles.body,
              padding: const EdgeInsets.symmetric(vertical: 14),
              textStyle: const TextStyle(
                fontFamily: 'PlusJakartaSans',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
