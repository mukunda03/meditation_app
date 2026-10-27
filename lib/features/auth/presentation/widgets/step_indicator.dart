import 'package:flutter/material.dart';

import 'auth_styles.dart';

/// "Step 1 of 2" label followed by one bar per step.
class StepIndicator extends StatelessWidget {
  const StepIndicator({super.key, required this.step, this.total = 2});

  final int step;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Step $step of $total',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AuthStyles.body,
          ),
        ),
        const SizedBox(width: 10),
        for (var i = 1; i <= total; i++)
          Container(
            width: 24,
            height: 6,
            margin: EdgeInsets.only(left: i == 1 ? 0 : 4),
            decoration: BoxDecoration(
              color: i <= step ? AuthStyles.primary : AuthStyles.indicatorIdle,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
      ],
    );
  }
}
