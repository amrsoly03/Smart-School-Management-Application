import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/models/question_model.dart';
import 'package:nexura/Core/widgets/question_form_field.dart';
import 'package:nexura/Features/Admin/presentation/manager/questions_cubit/questions_cubit.dart';

import '../../../../../Core/utils/theme.dart';

// ignore: must_be_immutable
class AddQuestionCard extends StatelessWidget {
  AddQuestionCard(
      {super.key, required this.questionModel, required this.index});

  QuestionModel questionModel;
  final int index;
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController answerController1 = TextEditingController();
  final TextEditingController answerController2 = TextEditingController();
  final TextEditingController answerController3 = TextEditingController();
  final TextEditingController rightAnswerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    QuestionsCubit questionsCubit = BlocProvider.of<QuestionsCubit>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: darkBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionFormField(
            labelText: 'Question Description',
            controller: descriptionController,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              questionModel = questionModel.updateQuestion(
                newDescription: value,
              );
              questionsCubit.updateQuestion(index, questionModel);
            },
          ),
          const SizedBox(height: 30),
          QuestionFormField(
            labelText: 'Right Answer',
            controller: rightAnswerController,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              questionModel = questionModel.updateQuestion(
                newRightAnswer: value,
              );
              questionsCubit.updateQuestion(index, questionModel);
            },
          ),
          const SizedBox(height: 15),
          QuestionFormField(
            labelText: 'Answer 1',
            controller: answerController1,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              questionModel = questionModel.updateQuestion(
                newAnswer1: value,
              );
              questionsCubit.updateQuestion(index, questionModel);
            },
          ),
          const SizedBox(height: 15),
          QuestionFormField(
            labelText: 'Answer 2',
            controller: answerController2,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              questionModel = questionModel.updateQuestion(
                newAnswer2: value,
              );
              questionsCubit.updateQuestion(index, questionModel);
            },
          ),
          const SizedBox(height: 15),
          QuestionFormField(
            labelText: 'Answer 3',
            controller: answerController3,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              questionModel = questionModel.updateQuestion(
                newAnswer3: value,
              );
              questionsCubit.updateQuestion(index, questionModel);
            },
          ),
        ],
      ),
    );
  }
}
