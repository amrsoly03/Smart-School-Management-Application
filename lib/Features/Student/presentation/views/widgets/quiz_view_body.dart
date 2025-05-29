import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/models/quiz_model.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Core/widgets/custom_button.dart';
import 'package:nexura/Core/widgets/custom_snackbar.dart';

import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/utils/theme.dart';
import '../../manager/student_cubit/student_cubit.dart';
import 'question_card.dart';

class QuizViewBody extends StatelessWidget {
  const QuizViewBody({super.key, required this.quizModel});

  final QuizModel quizModel;

  @override
  Widget build(BuildContext context) {
    StudentCubit studentCubit = BlocProvider.of<StudentCubit>(context);

    List questionAnswers = [];

    return Scaffold(
      appBar: const CustomAppBar(title: 'Quiz Name'),
      body: BlocConsumer<StudentCubit, StudentState>(
        listener: (context, state) {
          if (state is SubmitQuizSuccess) {
            kShowSnackBar(context, 'Quiz submitted successfully');
            GoRouter.of(context).pop();
          } else if (state is StudentFailure) {
            kShowSnackBar(context, state.errMessage);
          }
        },
        builder: (context, state) {
          if (state is StudentFailure) {
            return Center(
              child: Text(
                state.errMessage,
                style: Styles.textStyle20.copyWith(
                  color: darkBlue,
                ),
              ),
            );
          } else if (state is QuizQuestionsSuccess) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.questions.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      questionAnswers = [
                        state.questions[index].answer1,
                        state.questions[index].answer2,
                        state.questions[index].answer3,
                        state.questions[index].rightAnswer,
                      ];
                      questionAnswers.shuffle();
                      return QuestionCard(
                        questionModel: state.questions[index],
                        answers: questionAnswers,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      CustomButton(
                        title: 'submit',
                        function: () {
                          int correctAnswersCount =
                              studentCubit.choosenAnswers.where((element) {
                            return state.questions.any((question) {
                              return question.questionId.toString() ==
                                      element['questionId'] &&
                                  question.rightAnswer == element['answer'];
                            });
                          }).length;

                          log(correctAnswersCount.toString());

                          studentCubit.increasePracticalDegree(
                            subject_degree: quizModel.subQuiz.toString(),
                            increase_by: correctAnswersCount.toString(),
                          );

                          studentCubit.submitQuiz(qd_quiz: quizModel.quizId.toString());
                        },
                      ),
                    ],
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: darkBlue,
              ),
            );
          }
        },
      ),
    );
  }
}
