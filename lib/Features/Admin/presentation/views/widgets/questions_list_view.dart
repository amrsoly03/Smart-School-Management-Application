import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Features/Admin/presentation/manager/questions_cubit/questions_cubit.dart';

import 'add_question_card.dart';

class QuestionsListView extends StatelessWidget {
  const QuestionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsCubit, QuestionsState>(
      builder: (context, state) {
        if (state is AddQuestionSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.questions.length,
            itemBuilder: (context, index) {
              return AddQuestionCard(
                questionModel: state.questions[index],
                index: index,
              );
            },
          );
        } else if (state is QuestionsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is QuestionsFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return  Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Center(
              child: Text(
                'No questions added yet.',
                style: Styles.textStyle20.copyWith(
                  color: darkBlue,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
