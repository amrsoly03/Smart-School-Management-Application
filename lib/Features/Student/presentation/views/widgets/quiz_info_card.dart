import 'package:flutter/material.dart';

import '../../../../../Core/utils/theme.dart';

class QuizInfoCard extends StatelessWidget {
  const QuizInfoCard({
    super.key,
    required this.quiz,
  });

  final Map<String, String> quiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: darkBlue,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Subject : ${quiz['subject']}',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              'Quiz Name : ${quiz['quizName']}',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              'Questions : ${quiz['questions']}',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
