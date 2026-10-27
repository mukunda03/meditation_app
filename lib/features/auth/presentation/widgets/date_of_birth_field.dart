import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import 'auth_styles.dart';
import 'auth_text_field.dart';

class DateOfBirthField extends StatefulWidget {
  const DateOfBirthField({
    super.key,
    required this.value,
    required this.onChanged,
    this.errorText,
  });

  final DateTime? value;
  final ValueChanged<DateTime> onChanged;
  final String? errorText;

  static String format(DateTime date) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(date.day)} / ${two(date.month)} / ${date.year}';
  }

  @override
  State<DateOfBirthField> createState() => _DateOfBirthFieldState();
}

class _DateOfBirthFieldState extends State<DateOfBirthField> {
  late final _controller = TextEditingController(text: _text);

  String get _text =>
      widget.value == null ? '' : DateOfBirthField.format(widget.value!);

  @override
  void didUpdateWidget(DateOfBirthField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) _controller.text = _text;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _openCalendar() async {
    FocusScope.of(context).unfocus();
    final now = DateTime.now();
    final lastDate = DateTime(now.year - 5, now.month, now.day);
    final initial = widget.value ?? DateTime(now.year - 25, 1, 1);

    const dayStyle = TextStyle(fontSize: 14, color: AuthStyles.ink);
    final picked = await showCalendarDatePicker2Dialog(
      context: context,
      dialogSize: const Size(340, 420),
      borderRadius: BorderRadius.circular(24),
      dialogBackgroundColor: Colors.white,
      value: [initial],
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType: CalendarDatePicker2Type.single,
        firstDate: DateTime(1920),
        lastDate: lastDate,
        currentDate: initial,
        selectedDayHighlightColor: AuthStyles.primary,
        dayTextStyle: dayStyle,
        weekdayLabelTextStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AuthStyles.body,
        ),
        controlsTextStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: AuthStyles.ink,
        ),
        yearTextStyle: dayStyle,
        todayTextStyle: dayStyle,
        dayBorderRadius: BorderRadius.circular(12),
        okButtonTextStyle: AuthStyles.linkText,
        cancelButtonTextStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AuthStyles.body,
        ),
      ),
    );

    final date = picked?.firstOrNull;
    if (date != null) widget.onChanged(date);
  }

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      label: 'Date of birth',
      controller: _controller,
      hint: 'DD / MM / YYYY',
      readOnly: true,
      onTap: _openCalendar,
      suffix: const Icon(
        Icons.calendar_month_outlined,
        size: 22,
        color: AuthStyles.primary,
      ),
      errorText: widget.errorText,
    );
  }
}
