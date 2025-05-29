import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Features/Student/presentation/manager/student_cubit/student_cubit.dart';

import '../../../../../Core/utils/theme.dart';
import '../../../../../Core/widgets/custom_appBar.dart';
import 'quiz_info_card.dart';

class QuizzesViewBody extends StatelessWidget {
  const QuizzesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Quizzes'),
      body: BlocBuilder<StudentCubit, StudentState>(
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
          } else if (state is StudentQuizzesSuccess) {
            return Padding(
              padding: const EdgeInsets.all(25),
              child: ListView.builder(
                itemCount: state.quizzes.length,
                itemBuilder: (context, index) {
                  return QuizInfoCard(quizModel: state.quizzes[index]);
                },
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
