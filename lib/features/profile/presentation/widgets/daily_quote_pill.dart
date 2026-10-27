import 'package:flutter/material.dart';

class DailyQuotePill extends StatelessWidget {
  const DailyQuotePill({super.key, required this.quote});

  final String quote;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: const Color(0x80F3EEFA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0x80E9DEF5)),
      ),
      child: Row(
        children: [
          const Text('✨', style: TextStyle(fontSize: 16, height: 24 / 16)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              quote,
              style: const TextStyle(
                fontSize: 11,
                height: 16.5 / 11,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Color(0xFF4E2A6A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
