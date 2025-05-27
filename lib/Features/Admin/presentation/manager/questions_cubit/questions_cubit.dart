import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/models/question_model.dart';
import '../../../data/repo/admin_repo.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit(this.adminRepo) : super(QuestionsInitial());

  final AdminRepo adminRepo;

  List<QuestionModel> questions = [];

  void addQuestion() {
    emit(QuestionsInitial());
    try {
      questions.add(const QuestionModel(
        description: '',
        answer1: '',
        answer2: '',
        answer3: '',
        rightAnswer: '',
      ));
      emit(AddQuestionSuccess(questions));
      log(questions.toString());
    } catch (e) {
      log('Error adding question: ${e.toString()}');
      emit(
          const QuestionsFailure('Failed to add questions. Please try again.'));
      return;
    }
  }

  void updateQuestion(int index, QuestionModel newQuestion) {
    if (index >= 0 && index < questions.length) {
      questions[index] = newQuestion;
    }
    log(questions.toString());
  }

  void resetQuestions() {
    questions.clear();
    emit(QuestionsInitial());
  }
}
