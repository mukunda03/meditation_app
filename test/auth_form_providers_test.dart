import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_app/features/auth/providers/auth_form_providers.dart';

void main() {
  test('login errors appear on submit and clear once fields are valid', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final sub = container.listen(loginFormProvider, (_, _) {});
    final notifier = container.read(loginFormProvider.notifier);

    expect(sub.read().emailError, isNull);
    expect(notifier.submit(), isFalse);
    expect(sub.read().emailError, isNotNull);
    expect(sub.read().passwordError, isNotNull);

    notifier.setEmail('samyu@indosakura.com');
    expect(sub.read().emailError, isNull);
    notifier.setPassword('secret');
    expect(sub.read().passwordError, isNull);
    expect(notifier.submit(), isTrue);
  });

  test('sign up confirm error follows the password', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final sub = container.listen(signUpFormProvider, (_, _) {});
    final notifier = container.read(signUpFormProvider.notifier);

    notifier
      ..setEmail('a@b.co')
      ..setPassword('password1')
      ..setConfirmPassword('password2');
    expect(notifier.submit(), isFalse);
    expect(sub.read().confirmError, 'Passwords don\'t match');
    expect(sub.read().termsError, isNotNull);

    notifier
      ..setConfirmPassword('password1')
      ..setAgreedToTerms(true);
    expect(sub.read().confirmError, isNull);
    expect(sub.read().termsError, isNull);
    expect(notifier.submit(), isTrue);
  });
}
