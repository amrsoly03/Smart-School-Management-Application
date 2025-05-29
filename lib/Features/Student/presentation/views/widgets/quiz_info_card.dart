import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/models/quiz_model.dart';
import 'package:nexura/Core/utils/app_router.dart';
import 'package:nexura/Features/Student/presentation/manager/student_cubit/student_cubit.dart';

import '../../../../../Core/utils/theme.dart';

class QuizInfoCard extends StatelessWidget {
  const QuizInfoCard({
    super.key,
    required this.quizModel,
  });

  final QuizModel quizModel;

  @override
  Widget build(BuildContext context) {
    StudentCubit studentCubit = BlocProvider.of<StudentCubit>(context);
    return GestureDetector(
      onTap: () {
        studentCubit.viewQuizQuestions(
          question_quiz: quizModel.quizId.toString(),
        );
        GoRouter.of(context).pushReplacement(
          AppRouter.kQuizView,
          extra: quizModel,
        );
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
                'Subject : ${quizModel.subQuizName}',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                'Quiz Name : ${quizModel.name}',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                'Questions : ${quizModel.numOfQuestions}',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
