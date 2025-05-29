import 'package:flutter/widgets.dart';
import 'package:nexura/Core/models/quiz_model.dart';
import 'package:nexura/Features/Student/presentation/views/widgets/quiz_view_body.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key, required this.quizModel});

  final QuizModel quizModel;

  @override
  Widget build(BuildContext context) {
    return QuizViewBody(quizModel: quizModel);
  }
}
