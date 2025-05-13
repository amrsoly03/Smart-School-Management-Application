import 'package:flutter/material.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Core/widgets/custom_elevated_buttom.dart';

import 'question_card.dart';

// import '../Core/functions/capitalize.dart';
// import '../Core/utils/size_config.dart';
// import '../Core/utils/styles.dart';

class QuizViewBody extends StatefulWidget {
  const QuizViewBody({super.key});

  @override
  State<QuizViewBody> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizViewBody> {
  int? _question1Answer;
  int? _question2Answer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Quiz Name'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            QuestionCard(
              question: 'Question 1',
              groupValue: 0,
              onChanged: (value) => setState(() => _question1Answer = value),
            ),
            const SizedBox(height: 16),
            QuestionCard(
              question: 'Question 2',
              groupValue: 1,
              onChanged: (value) => setState(() => _question2Answer = value),
            ),
            const SizedBox(height: 30),
            CustomElevatedButton(label: 'Submit', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
