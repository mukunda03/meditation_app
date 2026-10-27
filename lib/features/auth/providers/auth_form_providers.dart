import 'package:country_picker/country_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../profile/data/profile_data.dart';
import '../presentation/auth_validators.dart';

// Errors stay hidden until the first submit. After that they are recomputed
// from the current values on every change, so a message clears as soon as
// the field becomes valid.

// ---------------------------------------------------------------------------
// Login
// ---------------------------------------------------------------------------

class LoginFormState {
  const LoginFormState({
    this.email = '',
    this.password = '',
    this.obscured = true,
    this.submitted = false,
  });

  final String email;
  final String password;
  final bool obscured;
  final bool submitted;

  String? get emailError => submitted ? AuthValidators.email(email) : null;
  String? get passwordError =>
      submitted ? AuthValidators.requiredPassword(password) : null;

  bool get isValid =>
      AuthValidators.email(email) == null &&
      AuthValidators.requiredPassword(password) == null;

  LoginFormState copyWith({
    String? email,
    String? password,
    bool? obscured,
    bool? submitted,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      obscured: obscured ?? this.obscured,
      submitted: submitted ?? this.submitted,
    );
  }
}

class LoginFormNotifier extends Notifier<LoginFormState> {
  @override
  LoginFormState build() => const LoginFormState();

  void setEmail(String value) => state = state.copyWith(email: value);
  void setPassword(String value) => state = state.copyWith(password: value);
  void toggleObscured() => state = state.copyWith(obscured: !state.obscured);

  /// Reveals any errors and reports whether the form can be sent.
  bool submit() {
    state = state.copyWith(submitted: true);
    return state.isValid;
  }
}

final loginFormProvider =
    NotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>(
      LoginFormNotifier.new,
    );

// ---------------------------------------------------------------------------
// Sign up (step 1)
// ---------------------------------------------------------------------------

class SignUpFormState {
  const SignUpFormState({
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.agreedToTerms = false,
    this.obscured = true,
    this.obscuredConfirm = true,
    this.submitted = false,
  });

  final String email;
  final String password;
  final String confirmPassword;
  final bool agreedToTerms;
  final bool obscured;
  final bool obscuredConfirm;
  final bool submitted;

  String? get _confirmProblem => confirmPassword.isEmpty
      ? 'Please confirm your password'
      : confirmPassword != password
      ? 'Passwords don\'t match'
      : null;
  String? get _termsProblem =>
      agreedToTerms ? null : 'Please agree to the Terms and Privacy Policy';

  String? get emailError => submitted ? AuthValidators.email(email) : null;
  String? get passwordError =>
      submitted ? AuthValidators.newPassword(password) : null;
  String? get confirmError => submitted ? _confirmProblem : null;
  String? get termsError => submitted ? _termsProblem : null;

  bool get isValid =>
      AuthValidators.email(email) == null &&
      AuthValidators.newPassword(password) == null &&
      _confirmProblem == null &&
      _termsProblem == null;

  SignUpFormState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    bool? agreedToTerms,
    bool? obscured,
    bool? obscuredConfirm,
    bool? submitted,
  }) {
    return SignUpFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      agreedToTerms: agreedToTerms ?? this.agreedToTerms,
      obscured: obscured ?? this.obscured,
      obscuredConfirm: obscuredConfirm ?? this.obscuredConfirm,
      submitted: submitted ?? this.submitted,
    );
  }
}

class SignUpFormNotifier extends Notifier<SignUpFormState> {
  @override
  SignUpFormState build() => const SignUpFormState();

  void setEmail(String value) => state = state.copyWith(email: value);
  void setPassword(String value) => state = state.copyWith(password: value);
  void setConfirmPassword(String value) =>
      state = state.copyWith(confirmPassword: value);
  void setAgreedToTerms(bool value) =>
      state = state.copyWith(agreedToTerms: value);
  void toggleObscured() => state = state.copyWith(obscured: !state.obscured);
  void toggleObscuredConfirm() =>
      state = state.copyWith(obscuredConfirm: !state.obscuredConfirm);

  bool submit() {
    state = state.copyWith(submitted: true);
    return state.isValid;
  }
}

final signUpFormProvider =
    NotifierProvider.autoDispose<SignUpFormNotifier, SignUpFormState>(
      SignUpFormNotifier.new,
    );

// ---------------------------------------------------------------------------
// Profile details (sign up step 2 and Edit Profile)
// ---------------------------------------------------------------------------

class ProfileFormState {
  const ProfileFormState({
    required this.country,
    this.name = '',
    this.dateOfBirth,
    this.photoPath,
    this.submitted = false,
  });

  final String name;
  final DateTime? dateOfBirth;
  final Country country;
  final String? photoPath;
  final bool submitted;

  String? get nameError => submitted ? AuthValidators.fullName(name) : null;
  String? get dateOfBirthError => submitted && dateOfBirth == null
      ? 'Please select your date of birth'
      : null;

  bool get isValid =>
      AuthValidators.fullName(name) == null && dateOfBirth != null;

  String get initials {
    final letters = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .take(2)
        .map((part) => part[0]);
    final initials = letters.join().toUpperCase();
    return initials.isEmpty ? '?' : initials;
  }

  ProfileFormState copyWith({
    String? name,
    DateTime? dateOfBirth,
    Country? country,
    String? photoPath,
    bool? submitted,
  }) {
    return ProfileFormState(
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      country: country ?? this.country,
      photoPath: photoPath ?? this.photoPath,
      submitted: submitted ?? this.submitted,
    );
  }
}

class ProfileFormNotifier extends Notifier<ProfileFormState> {
  ProfileFormNotifier(this._initial);

  final ProfileFormState Function() _initial;

  @override
  ProfileFormState build() => _initial();

  void setName(String value) => state = state.copyWith(name: value);
  void setDateOfBirth(DateTime value) =>
      state = state.copyWith(dateOfBirth: value);
  void setCountry(Country value) => state = state.copyWith(country: value);
  void setPhotoPath(String value) => state = state.copyWith(photoPath: value);

  bool submit() {
    state = state.copyWith(submitted: true);
    return state.isValid;
  }
}

final _india = Country.parse('IN');

/// Blank form for a brand-new account.
final completeProfileFormProvider =
    NotifierProvider.autoDispose<ProfileFormNotifier, ProfileFormState>(
      () => ProfileFormNotifier(() => ProfileFormState(country: _india)),
    );

/// Pre-filled with the signed-in user's details.
final editProfileFormProvider =
    NotifierProvider.autoDispose<ProfileFormNotifier, ProfileFormState>(
      () => ProfileFormNotifier(
        () => ProfileFormState(
          name: currentUser.name,
          dateOfBirth: currentUserDateOfBirth,
          country: Country.tryParse(currentUser.country) ?? _india,
        ),
      ),
    );
