import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Core/widgets/custom_form_field.dart';
import 'package:nexura/Core/widgets/custom_snackbar.dart';
import 'package:nexura/Features/Admin/presentation/manager/questions_cubit/questions_cubit.dart';
import 'package:nexura/Features/Admin/presentation/views/widgets/confirm_button.dart';

import '../../../../../Core/models/subject_model.dart';
import '../../../../../Core/widgets/custom_bottom_sheet.dart';
import '../../../../../Core/widgets/custom_button.dart';
import '../../manager/admin_cubit/admin_cubit.dart';
import '../../manager/models_cubit/models_cubit.dart';
import '../../manager/select_models_cubit/select_models_cubit.dart';
import 'grades_sheet.dart';
import 'questions_list_view.dart';

// ignore: must_be_immutable
class AddExamViewBody extends StatelessWidget {
  AddExamViewBody({super.key});

  final TextEditingController examNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ModelsCubit modelsCubit = BlocProvider.of<ModelsCubit>(context);
    SelectModelsCubit selectModelsCubit =
        BlocProvider.of<SelectModelsCubit>(context);
    AdminCubit adminCubit = BlocProvider.of<AdminCubit>(context);
    QuestionsCubit questionsCubit = BlocProvider.of<QuestionsCubit>(context);
    String selectedSubject = 'choose subject';
    SubjectModel subjectModel = const SubjectModel();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Exam'),
      body: BlocConsumer<SelectModelsCubit, SelectModelsState>(
        listener: (context, state) {
          if (state is SubjectSelected) {
            selectedSubject = state.selectedSubject.name!;
            subjectModel = state.selectedSubject;
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Exam Name
                CustomFormField(
                  labelText: 'exam name',
                  controller: examNameController,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    CustomButton(
                      title: selectedSubject,
                      function: () {
                        modelsCubit.viewGrades();
                        CustomBottomSheet(
                          context,
                          const GradesSheet(),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const QuestionsListView(),
                const SizedBox(height: 10),
                // Add Button
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.add_circle,
                      color: darkBlue,
                      size: 40,
                    ),
                    onPressed: () {
                      questionsCubit.addQuestion();
                    },
                  ),
                ),
                const SizedBox(height: 10),
                // Submit Button
                Row(
                  children: [
                    BlocListener<AdminCubit, AdminState>(
                      listener: (context, state) {
                        if (state is AddQuizSuccess) {
                          log('start add all questions');
                          adminCubit
                              .addAllQuestions(
                            question_quiz: state.quizModel.quizId.toString(),
                            questions: questionsCubit.questions,
                          )
                              .then(
                            (val) {
                              questionsCubit.resetQuestions();
                              GoRouter.of(context).pop();
                            },
                            onError: (_) {},
                          );
                        }
                      },
                      child: ConfirmButton(
                        title: 'submit',
                        function: () {
                          if (examNameController.text.isEmpty) {
                            return kShowSnackBar(context, 'enter exam name');
                          }
                          if (subjectModel.subjectId == null) {
                            return kShowSnackBar(
                                context, 'select subject first');
                          }
                          if (questionsCubit.questions.isEmpty) {
                            return kShowSnackBar(
                                context, 'add questions first');
                          }
                          adminCubit.addQuiz(
                            name: examNameController.text,
                            sub_quiz: selectModelsCubit
                                .selectedSubject.subjectId
                                .toString(),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
