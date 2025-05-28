import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:nexura/Core/models/activity_model.dart';
import 'package:nexura/Core/models/grade_model.dart';
import 'package:nexura/Core/models/question_model.dart';
import 'package:nexura/Core/models/quiz_model.dart';
import 'package:nexura/Core/models/report_model.dart';
import 'package:nexura/Core/models/subject_model.dart';
import 'package:nexura/Features/Admin/data/repo/admin_repo.dart';

import '../../../../Core/errors/failures.dart';
import '../../../../Core/utils/api_service.dart';
import '../../../../Core/utils/links.dart';
import '../models/admin_model.dart';

class AdminRepoImpl implements AdminRepo {
  final ApiService apiService;

  AdminRepoImpl(this.apiService);

  @override
  Future<Either<Failures, AdminModel>> adminLogin({
    required String email,
    required String admin_password,
    required String type,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkAdminLogin,
        data: {
          'email': email,
          'admin_password': admin_password,
          'type': type,
        },
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures('something went wrong, try again'));
      } else {
        AdminModel adminModel = AdminModel.fromJson(response['data']);
        return right(adminModel);
      }
    } catch (e) {
      if (e is SocketException) {
        return left(ServerFailures('No internet connection'));
      }
      log('e: $e');
      return left(ServerFailures('something went wrong'));
    }
  }

  @override
  Future<Either<Failures, String>> createUser({
    required String s_name,
    required String email,
    required String student_password,
    required String parent_password,
    required String grade,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkCreateUser,
        data: {
          's_name': s_name,
          'email': email,
          'student_password': student_password,
          'parent_password': parent_password,
          'grade': grade,
        },
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures('something went wrong, try again'));
      } else {
        return right(response['message']);
      }
    } catch (e) {
      if (e is SocketException) {
        return left(ServerFailures('No internet connection'));
      }
      log('e: $e');
      return left(ServerFailures('something went wrong'));
    }
  }

  @override
  Future<Either<Failures, String>> editUser({
    required String student_id,
    required String s_name,
    required String email,
    required String student_password,
    required String parent_password,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkEditUser,
        data: {
          'student_id': student_id,
          's_name': s_name,
          'email': email,
          'student_password': student_password,
          'parent_password': parent_password,
        },
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures(response['message']));
      } else {
        return right(response['message']);
      }
    } catch (e) {
      if (e is SocketException) {
        return left(ServerFailures('No internet connection'));
      }
      log('e: $e');
      return left(ServerFailures('something went wrong'));
    }
  }

  @override
  Future<Either<Failures, String>> sendReport({
    required String std_report,
    required String content,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkAdminSendReport,
        data: {
          'std_report': std_report,
          'content': content,
        },
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures(response['message']));
      } else {
        return right(response['message']);
      }
    } catch (e) {
      if (e is SocketException) {
        return left(ServerFailures('No internet connection'));
      }
      log('e: $e');
      return left(ServerFailures('something went wrong'));
    }
  }

  @override
  Future<Either<Failures, String>> sendActivityNotification({
    required String activity_an,
    required String content,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkSendActivityNotification,
        data: {
          'activity_an': activity_an,
          'content': content,
        },
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures(response['message']));
      } else {
        return right(response['message']);
      }
    } catch (e) {
      if (e is SocketException) {
        return left(ServerFailures('No internet connection'));
      }
      log('e: $e');
      return left(ServerFailures('something went wrong'));
    }
  }

  @override
  Future<Either<Failures, List<ActivityModel>>> viewActivities() async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkViewActivities,
        data: {},
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures(response['message']));
      } else {
        List<ActivityModel> activities = [];

        for (var item in response['data']) {
          activities.add(ActivityModel.fromJson(item));
        }

        return right(activities);
      }
    } catch (e) {
      if (e is SocketException) {
        return left(ServerFailures('No internet connection'));
      }
      log('e: $e');
      return left(ServerFailures('something went wrong'));
    }
  }

  @override
  Future<Either<Failures, List<ReportModel>>> viewAdminSentReports() async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkViewAdminSentReports,
        data: {},
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures(response['message']));
      } else {
        List<ReportModel> reports = [];

        for (var item in response['data']) {
          reports.add(ReportModel.fromJson(item));
        }

        return right(reports);
      }
    } catch (e) {
      if (e is SocketException) {
        return left(ServerFailures('No internet connection'));
      }
      log('e: $e');
      return left(ServerFailures('something went wrong'));
    }
  }

  @override
  Future<Either<Failures, List<SubjectModel>>> viewApprovmentSubject() async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkViewApprovmentSubjects,
        data: {},
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures(response['message']));
      } else {
        List<SubjectModel> subjects = [];

        for (var item in response['data']) {
          subjects.add(SubjectModel.fromJson(item));
        }

        return right(subjects);
      }
    } catch (e) {
      if (e is SocketException) {
        return left(ServerFailures('No internet connection'));
      }
      log('e: $e');
      return left(ServerFailures('something went wrong'));
    }
  }

  @override
  Future<Either<Failures, String>> approveSubject({
    required String as_id,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkApproveSubject,
        data: {
          'as_id': as_id,
        },
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures(response['message']));
      } else {
        return right(response['message']);
      }
    } catch (e) {
      if (e is SocketException) {
        return left(ServerFailures('No internet connection'));
      }
      log('e: $e');
      return left(ServerFailures('something went wrong'));
    }
  }

  @override
  Future<Either<Failures, List<GradeModel>>> viewGrades() async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkViewGrades,
        data: {},
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures(response['message']));
      } else {
        List<GradeModel> grades = [];

        for (var item in response['data']) {
          grades.add(GradeModel.fromJson(item));
        }

        return right(grades);
      }
    } catch (e) {
      if (e is SocketException) {
        return left(ServerFailures('No internet connection'));
      }
      log('e: $e');
      return left(ServerFailures('something went wrong'));
    }
  }

  @override
  Future<Either<Failures, List<SubjectModel>>> viewSubjects({
    required String sub_grade,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkViewSubjects,
        data: {
          'sub_grade': sub_grade,
        },
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures(response['message']));
      } else {
        List<SubjectModel> subjects = [];

        for (var item in response['data']) {
          subjects.add(SubjectModel.fromJson(item));
        }

        return right(subjects);
      }
    } catch (e) {
      if (e is SocketException) {
        return left(ServerFailures('No internet connection'));
      }
      log('e: $e');
      return left(ServerFailures('something went wrong'));
    }
  }

  @override
  Future<Either<Failures, String>> updateDegrees({
    required String subject_degree,
    required String std_degree,
    required String final_degree,
    required String mid,
    required String practical,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkUpdateDegrees,
        data: {
          'subject_degree': subject_degree,
          'std_degree': std_degree,
          'final': final_degree,
          'mid': mid,
          'practical': practical,
        },
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures(response['message']));
      } else {
        return right(response['message']);
      }
    } catch (e) {
      if (e is SocketException) {
        return left(ServerFailures('No internet connection'));
      }
      log('e: $e');
      return left(ServerFailures('something went wrong'));
    }
  }

  @override
  Future<Either<Failures, QuizModel>> addQuiz({
    required String name,
    required String sub_quiz,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkAddQuiz,
        data: {
          'name': name,
          'sub_quiz': sub_quiz,
        },
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures('something went wrong, try again'));
      } else {
        QuizModel quizModel = QuizModel.fromJson(response['data']);
        return right(quizModel);
      }
    } catch (e) {
      if (e is SocketException) {
        return left(ServerFailures('No internet connection'));
      }
      log('e: $e');
      return left(ServerFailures('something went wrong'));
    }
  }

  @override
  Future<void> addAllQuestions({
    required String question_quiz,
    required List<QuestionModel> questions,
  }) async {
    try {
      List<Future<void>> futures = [];
      for (var item in questions) {
        futures.add(apiService.httpPost(
          link: Links.linkAddQuestion,
          data: {
            'question_quiz': question_quiz,
            'description': item.description,
            'answer1': item.answer1,
            'answer2': item.answer2,
            'answer3': item.answer3,
            'right_answer': item.rightAnswer,
          },
        ).then((response) {
          log('response: $response');
          if (response['status'] == 'failed') {
            log((response['message']));
          } else {
            log(response['message']);
          }
        }));
      }
      await Future.wait(futures);
    } catch (e) {
      if (e is SocketException) {
        return log(('No internet connection'));
      }
      log('e: $e');
      return log(('something went wrong'));
    }
  }

  @override
  Future<Either<Failures, String>> addProduct({
    required String product_name,
    required String product_category,
    required String product_price,
    required File product_image,
  }) async {
    try {
      log('image: $product_image');
      Map<String, dynamic> response = await apiService.postRequestWithFile(
        link: Links.linkAddProduct,
        fieldName: 'product_image',
        data: {
          'product_name': product_name,
          'product_category': product_category,
          'product_price': product_price,
        },
        file: product_image,
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures(response['message']));
      } else {
        return right(response['message']);
      }
    } catch (e) {
      if (e is SocketException) {
        return left(ServerFailures('No internet connection'));
      }
      log('e: $e');
      return left(ServerFailures('something went wrong'));
    }
  }

}
