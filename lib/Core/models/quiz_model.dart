import 'package:equatable/equatable.dart';

class QuizModel extends Equatable {
  final int? quizId;
  final String? name;
  final int? subQuiz;

  const QuizModel({this.quizId, this.name, this.subQuiz});

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        quizId: json['quiz_id'] as int?,
        name: json['name'] as String?,
        subQuiz: json['sub_quiz'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'quiz_id': quizId,
        'name': name,
        'sub_quiz': subQuiz,
      };

  @override
  List<Object?> get props => [quizId, name, subQuiz];
}
