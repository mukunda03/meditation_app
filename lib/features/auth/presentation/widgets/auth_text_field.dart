import 'package:flutter/material.dart';

import 'auth_styles.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.label,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.errorText,
    this.hint,
    this.helper,
    this.suffix,
    this.onTap,
    this.readOnly = false,
    this.locked = false,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.autofillHints,
  });

  final String label;
  final TextEditingController? controller;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  final String? errorText;
  final String? hint;
  final String? helper;
  final Widget? suffix;
  final VoidCallback? onTap;
  final bool readOnly;
  final bool locked;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final Iterable<String>? autofillHints;

  static OutlineInputBorder _border(Color color, [double width = 1]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AuthStyles.fieldLabel),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          onChanged: onChanged,
          onTap: onTap,
          readOnly: readOnly || locked,
          enableInteractiveSelection: !(readOnly || locked),
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          autofillHints: autofillHints,
          mouseCursor: onTap != null ? SystemMouseCursors.click : null,
          style: TextStyle(
            fontSize: 16,
            color: locked ? AuthStyles.body : AuthStyles.ink,
          ),
          decoration: InputDecoration(
            hintText: hint,
            errorText: errorText,
            errorMaxLines: 2,
            hintStyle: const TextStyle(fontSize: 16, color: AuthStyles.hint),
            filled: true,
            fillColor: locked ? AuthStyles.lockedFill : Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            suffixIcon: locked
                ? const Icon(
                    Icons.lock_outline_rounded,
                    size: 20,
                    color: AuthStyles.body,
                  )
                : suffix,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 52,
              minHeight: 24,
            ),
            border: _border(AuthStyles.fieldBorder),
            enabledBorder: _border(AuthStyles.fieldBorder),
            focusedBorder: locked
                ? _border(AuthStyles.fieldBorder)
                : _border(AuthStyles.primary, 1.4),
            errorBorder: _border(const Color(0xFFE11D48)),
            focusedErrorBorder: _border(const Color(0xFFE11D48), 1.4),
          ),
        ),
        if (helper != null && errorText == null) ...[
          const SizedBox(height: 8),
          Text(helper!, style: AuthStyles.helper),
        ],
      ],
    );
  }
}

class PasswordVisibilityToggle extends StatelessWidget {
  const PasswordVisibilityToggle({
    super.key,
    required this.obscured,
    required this.onToggle,
  });

  final bool obscured;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onToggle,
      tooltip: obscured ? 'Show password' : 'Hide password',
      icon: Icon(
        obscured ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        size: 22,
        color: AuthStyles.body,
      ),
    );
  }
}
