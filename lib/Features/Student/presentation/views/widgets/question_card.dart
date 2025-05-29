import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/models/question_model.dart';
import 'package:nexura/Features/Student/presentation/manager/student_cubit/student_cubit.dart';
import '../../../../../Core/utils/theme.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    super.key,
    required this.questionModel,
    required this.answers,
  });
  final QuestionModel questionModel;
  final List answers;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  int? groupValue = -1;

  @override
  Widget build(BuildContext context) {
    StudentCubit studentCubit = BlocProvider.of<StudentCubit>(context);

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
            widget.questionModel.description!,
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
              onChanged: (value) {
                String answer = widget.answers[value!];
                String questionId = widget.questionModel.questionId.toString();

                // Check if choosenAnswers already contains an answer with the same questionId
                int existingIndex = studentCubit.choosenAnswers.indexWhere(
                    (element) => element['questionId'] == questionId);

                if (existingIndex != -1) {
                  // Replace the existing answer with the new one
                  studentCubit.choosenAnswers[existingIndex] = {
                    'questionId': questionId,
                    'answer': answer
                  };
                } else {
                  // Add a new answer to the list
                  studentCubit.choosenAnswers
                      .add({'questionId': questionId, 'answer': answer});
                }

                setState(() {
                  groupValue = value;
                  log('choosenAnswers: ${studentCubit.choosenAnswers}');
                });
              },
              title: Text(
                widget.answers[index]!,
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
