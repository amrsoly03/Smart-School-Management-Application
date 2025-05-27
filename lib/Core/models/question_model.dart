import 'package:equatable/equatable.dart';

class QuestionModel extends Equatable {
  final int? questionId;
  final int? questionQuiz;
  final String? description;
  final String? answer1;
  final String? answer2;
  final String? answer3;
  final String? rightAnswer;

  const QuestionModel({
    this.questionId,
    this.questionQuiz,
    this.description,
    this.answer1,
    this.answer2,
    this.answer3,
    this.rightAnswer,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        questionId: json['question_id'] as int?,
        questionQuiz: json['question_quiz'] as int?,
        description: json['description'] as String?,
        answer1: json['answer1'] as String?,
        answer2: json['answer2'] as String?,
        answer3: json['answer3'] as String?,
        rightAnswer: json['right_answer'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'question_id': questionId,
        'question_quiz': questionQuiz,
        'description': description,
        'answer1': answer1,
        'answer2': answer2,
        'answer3': answer3,
        'right_answer': rightAnswer,
      };

  @override
  List<Object?> get props {
    return [
      questionId,
      questionQuiz,
      description,
      answer1,
      answer2,
      answer3,
      rightAnswer,
    ];
  }

  QuestionModel updateQuestion({
    String? newDescription,
    String? newAnswer1,
    String? newAnswer2,
    String? newAnswer3,
    String? newRightAnswer,
  }){
    return QuestionModel(
      questionId: questionId,
      questionQuiz: questionQuiz,
      description: newDescription ?? description,
      answer1: newAnswer1 ?? answer1,
      answer2: newAnswer2 ?? answer2,
      answer3: newAnswer3 ?? answer3,
      rightAnswer: newRightAnswer ?? rightAnswer,
    );
  }
}
