import 'package:flutter/material.dart';
import '../../../../../Core/utils/theme.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
    required this.groupValue,
    required this.onChanged,
  });
  final String question;
  final int groupValue;
  final void Function(int?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: darkBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          ...List.generate(4, (index) {
            return RadioListTile<int>(
              value: index,
              groupValue: groupValue,
              onChanged: onChanged,
              title: Text(
                'Answer ${index + 1}',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              activeColor: Colors.white,
              contentPadding: EdgeInsets.zero,
            );
          }),
        ],
      ),
    );
  }
}
