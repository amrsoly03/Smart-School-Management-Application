import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures.dart';
import '../../../../Core/models/activity_model.dart';
import '../../../../Core/models/grade_model.dart';
import '../../../../Core/models/question_model.dart';
import '../../../../Core/models/quiz_model.dart';
import '../../../../Core/models/report_model.dart';
import '../../../../Core/models/subject_model.dart';
import '../models/admin_model.dart';

abstract class AdminRepo {
  Future<Either<Failures, AdminModel>> adminLogin({
    required String email,
    required String admin_password,
    required String type,
  });

  Future<Either<Failures, String>> createUser({
    required String s_name,
    required String email,
    required String student_password,
    required String parent_password,
    required String grade,
  });

  Future<Either<Failures, String>> editUser({
    required String student_id,
    required String s_name,
    required String email,
    required String student_password,
    required String parent_password,
  });

  Future<Either<Failures, String>> sendReport({
    required String std_report,
    required String content,
  });

  Future<Either<Failures, String>> sendActivityNotification({
    required String activity_an,
    required String content,
  });

  Future<Either<Failures, List<ReportModel>>> viewAdminSentReports();

  Future<Either<Failures, String>> approveSubject({
    required String as_id,
  });

  Future<Either<Failures, List<ActivityModel>>> viewActivities();

  Future<Either<Failures, List<SubjectModel>>> viewApprovmentSubject();

  Future<Either<Failures, List<GradeModel>>> viewGrades();

  Future<Either<Failures, List<SubjectModel>>> viewSubjects({
    required String sub_grade,
  });

  Future<Either<Failures, String>> updateDegrees({
    required String subject_degree,
    required String std_degree,
    required String final_degree,
    required String mid,
    required String practical,
  });

  Future<Either<Failures, QuizModel>> addQuiz({
    required String name,
    required String sub_quiz,
  });

  Future<void> addAllQuestions({
    required String question_quiz,
    required List<QuestionModel> questions,
  });

  Future<Either<Failures, String>> addProduct({
    required String product_name,
    required String product_category,
    required String product_price,
    required File product_image,
  });
}
