import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import 'auth_styles.dart';
import 'auth_text_field.dart';

class CountryField extends StatefulWidget {
  const CountryField({super.key, required this.value, required this.onChanged});

  final Country value;
  final ValueChanged<Country> onChanged;

  @override
  State<CountryField> createState() => _CountryFieldState();
}

class _CountryFieldState extends State<CountryField> {
  late final _controller = TextEditingController(text: widget.value.name);

  @override
  void didUpdateWidget(CountryField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _controller.text = widget.value.name;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openPicker() {
    FocusScope.of(context).unfocus();
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AuthStyles.fieldBorder),
    );
    showCountryPicker(
      context: context,
      favorite: [widget.value.countryCode],
      onSelect: widget.onChanged,
      countryListTheme: CountryListThemeData(
        backgroundColor: Colors.white,
        bottomSheetHeight: MediaQuery.sizeOf(context).height * 0.75,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        textStyle: const TextStyle(fontSize: 15, color: AuthStyles.ink),
        searchTextStyle: const TextStyle(fontSize: 15, color: AuthStyles.ink),
        inputDecoration: InputDecoration(
          hintText: 'Search country',
          hintStyle: const TextStyle(color: AuthStyles.hint),
          prefixIcon: const Icon(Icons.search_rounded, color: AuthStyles.body),
          border: border,
          enabledBorder: border,
          focusedBorder: border.copyWith(
            borderSide: const BorderSide(color: AuthStyles.primary, width: 1.4),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      label: 'Country',
      controller: _controller,
      readOnly: true,
      onTap: _openPicker,
      suffix: const Icon(
        Icons.keyboard_arrow_down_rounded,
        size: 26,
        color: AuthStyles.primary,
      ),
    );
  }
}
