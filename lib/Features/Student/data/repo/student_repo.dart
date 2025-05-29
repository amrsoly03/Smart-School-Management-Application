import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures.dart';
import '../../../../Core/models/degree_model.dart';
import '../../../../Core/models/order_model.dart';
import '../../../../Core/models/product_model.dart';
import '../../../../Core/models/question_model.dart';
import '../../../../Core/models/quiz_model.dart';
import '../models/student_model.dart';

abstract class StudentRepo {
  Future<Either<Failures, StudentModel>> studentLogin({
    required String student_Id,
    required String student_password,
  });

  Future<Either<Failures, List<DegreeModel>>> viewDegrees({
    required String std_degree,
  });

  Future<Either<Failures, List<QuizModel>>> viewStudentQuizzes({
    required String student_id,
  });

  Future<Either<Failures, List<QuestionModel>>> viewQuizQuestions({
    required String question_quiz,
  });

  Future<Either<Failures, String>> submitQuiz({
    required String qd_quiz,
    required String qd_student,
  });

  Future<Either<Failures, String>> increasePracticalDegree({
    required String std_degree,
    required String subject_degree,
    required String increase_by,
  });

  Future<Either<Failures, String>> viewSchedule({
    required String grade_id,
  });

  Future<Either<Failures, String>> subscribeActivity({
    required String student_as,
    required String activity_as,
  });

  Future<Either<Failures, List<ProductModel>>> viewProducts({
    required String product_category,
  });

  Future<Either<Failures, OrderModel>> addOrder(
      {required String order_student});

  Future<void> addOrderProducts({
    required String op_order,
    required List<ProductModel> products,
  });
}
