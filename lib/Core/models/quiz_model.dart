import 'package:equatable/equatable.dart';

class QuizModel extends Equatable {
  final int? quizId;
  final String? name;
  final int? subQuiz;
  final String? subQuizName;

  const QuizModel({
    this.quizId,
    this.name,
    this.subQuiz,
    this.subQuizName,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        quizId: json['quiz_id'] as int?,
        name: json['name'] as String?,
        subQuiz: json['sub_quiz'] as int?,
        subQuizName: json['sub_quiz_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'quiz_id': quizId,
        'name': name,
        'sub_quiz': subQuiz,
        'sub_quiz_name': subQuizName,
      };

  @override
  List<Object?> get props => [
        quizId,
        name,
        subQuiz,
        subQuizName,
      ];
}
