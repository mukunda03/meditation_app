class AuthValidators {
  AuthValidators._();

  static final _email = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  static final _digit = RegExp(r'\d');

  static String? email(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Please enter your email';
    if (!_email.hasMatch(text)) return 'Please enter a valid email';
    return null;
  }

  static String? requiredPassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your password';
    return null;
  }

  static String? newPassword(String? value) {
    final text = value ?? '';
    if (text.length < 8 || !_digit.hasMatch(text)) {
      return 'Use at least 8 characters, with one number';
    }
    return null;
  }

  static String? fullName(String? value) {
    if ((value?.trim() ?? '').isEmpty) return 'Please enter your full name';
    return null;
  }
}
