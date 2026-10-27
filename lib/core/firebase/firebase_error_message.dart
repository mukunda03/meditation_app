import 'package:firebase_auth/firebase_auth.dart';

String firebaseErrorMessage(Object? error) {
  if (error is FirebaseAuthException) {
    switch (error.code) {
      case 'invalid-credential':
      case 'wrong-password':
      case 'user-not-found':
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Incorrect email or password.';
      case 'email-already-in-use':
        return 'An account already exists for this email. Try logging in.';
      case 'invalid-email':
        return 'Please enter a valid email.';
      case 'weak-password':
        return 'Please choose a stronger password.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'too-many-requests':
        return 'Too many attempts. Please wait a moment and try again.';
      case 'requires-recent-login':
        return 'For your security, please enter your password again.';
      case 'network-request-failed':
        return 'No internet connection. Please check and try again.';
    }
  }
  if (error is FirebaseException) {
    switch (error.code) {
      case 'unavailable':
        return 'No internet connection. Please check and try again.';
      case 'permission-denied':
        return 'You don\'t have permission to do that.';
    }
  }
  if (error is ImageTooLargeException) {
    return 'That photo is too large. Please choose another one.';
  }
  return 'Something went wrong. Please try again.';
}

class ImageTooLargeException implements Exception {
  const ImageTooLargeException();
}
