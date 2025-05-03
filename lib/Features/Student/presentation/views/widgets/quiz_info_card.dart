import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/utils/app_router.dart';

import '../../../../../Core/utils/theme.dart';

class QuizInfoCard extends StatelessWidget {
  const QuizInfoCard({
    super.key,
    required this.quiz,
  });

  final Map<String, String> quiz;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kQuizView);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: darkBlue,
          borderRadius: BorderRadius.circular(25),
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
      ),
    );
  }
}
