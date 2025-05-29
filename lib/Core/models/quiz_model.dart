import 'package:equatable/equatable.dart';

class QuizModel extends Equatable {
  final int? quizId;
  final String? name;
  final int? subQuiz;
  final String? subQuizName;
  final int? numOfQuestions;

  const QuizModel({
    this.quizId,
    this.name,
    this.subQuiz,
    this.subQuizName,
    this.numOfQuestions,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        quizId: json['quiz_id'] as int?,
        name: json['name'] as String?,
        subQuiz: json['sub_quiz'] as int?,
        subQuizName: json['sub_quiz_name'] as String?,
        numOfQuestions: json['num_of_questions'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'quiz_id': quizId,
        'name': name,
        'sub_quiz': subQuiz,
        'sub_quiz_name': subQuizName,
        'num_of_questions': numOfQuestions,
      };

  @override
  List<Object?> get props => [
        quizId,
        name,
        subQuiz,
        subQuizName,
        numOfQuestions,
      ];
}
