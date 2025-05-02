import 'package:flutter/material.dart';

import '../../../../../Core/widgets/custom_appBar.dart';
import 'quiz_info_card.dart';

class QuizzesViewBody extends StatelessWidget {
  QuizzesViewBody({super.key});

  final List<Map<String, String>> quizzes = [
    {'subject': 'Math', 'quizName': 'unit 1', 'questions': '5'},
    {'subject': 'English', 'quizName': 'unit 2', 'questions': '3'},
    {'subject': 'Arabic', 'quizName': 'unit 3', 'questions': '8'},
    {'subject': 'French', 'quizName': 'unit 4', 'questions': '10'},
    {'subject': 'Science', 'quizName': 'unit 7', 'questions': '2'},
    {'subject': 'History', 'quizName': 'unit 6', 'questions': '6'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Quizzes'),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: ListView.builder(
          itemCount: quizzes.length,
          itemBuilder: (context, index) {
            final quiz = quizzes[index];
            return QuizInfoCard(quiz: quiz);
          },
        ),
      ),
    );
  }
}
