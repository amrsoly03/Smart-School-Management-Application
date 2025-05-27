part of 'questions_cubit.dart';

sealed class QuestionsState extends Equatable {
  const QuestionsState();

  @override
  List<Object> get props => [];
}

final class QuestionsInitial extends QuestionsState {}

final class QuestionsLoading extends QuestionsState {}

final class QuestionsFailure extends QuestionsState {
  final String errMessage;

  const QuestionsFailure(this.errMessage);
}

final class AddQuestionSuccess extends QuestionsState {
  final List<QuestionModel> questions;

  const AddQuestionSuccess(this.questions);
}
