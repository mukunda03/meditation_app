import 'package:flutter/material.dart';

import '../firebase/firebase_error_message.dart';

void showAppSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
}

void showErrorSnackBar(BuildContext context, Object? error) {
  showAppSnackBar(context, firebaseErrorMessage(error));
}
