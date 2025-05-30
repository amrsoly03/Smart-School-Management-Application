import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:nexura/Core/models/degree_model.dart';
import 'package:nexura/Core/models/order_model.dart';
import 'package:nexura/Core/models/product_model.dart';
import 'package:nexura/Core/models/question_model.dart';
import 'package:nexura/Core/models/quiz_model.dart';
import 'package:nexura/Features/Student/data/models/student_model.dart';
import 'package:nexura/Features/Student/data/repo/student_repo.dart';

import '../../../../Core/errors/failures.dart';
import '../../../../Core/utils/api_service.dart';
import '../../../../Core/utils/links.dart';

class StudentRepoImpl implements StudentRepo {
  final ApiService apiService;

  StudentRepoImpl(this.apiService);

  @override
  Future<Either<Failures, StudentModel>> studentLogin({
    required String student_Id,
    required String student_password,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkStudentLogin,
        data: {
          'student_Id': student_Id,
          'student_password': student_password,
        },
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures('something went wrong, try again'));
      } else {
        StudentModel studentModel = StudentModel.fromJson(response['data']);
        return right(studentModel);
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
  Future<Either<Failures, List<DegreeModel>>> viewDegrees({
    required String std_degree,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkViewDegrees,
        data: {
          'std_degree': std_degree,
        },
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures(response['message']));
      } else {
        List<DegreeModel> degrees = [];

        for (var item in response['data']) {
          degrees.add(DegreeModel.fromJson(item));
        }

        return right(degrees);
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
  Future<Either<Failures, String>> viewSchedule({
    required String grade_id,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkViewSchedule,
        data: {
          'grade_id': grade_id,
        },
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures(response['message']));
      } else {
        return right(response['data']['schedule_image']);
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
  Future<Either<Failures, String>> subscribeActivity({
    required String student_as,
    required String activity_as,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkSubscribeActivity,
        data: {
          'student_as': student_as,
          'activity_as': activity_as,
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
  Future<Either<Failures, List<ProductModel>>> viewProducts({
    required String product_category,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkViewProducts,
        data: {
          'product_category': product_category,
        },
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures(response['message']));
      } else {
        List<ProductModel> products = [];

        for (var item in response['data']) {
          products.add(ProductModel.fromJson(item));
        }

        return right(products);
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
  Future<Either<Failures, OrderModel>> addOrder(
      {required String order_student}) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkAddOrder,
        data: {
          'order_student': order_student,
        },
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures(response['message']));
      } else {
        OrderModel orderModel = OrderModel.fromJson(response['data']);
        return right(orderModel);
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
  Future<void> addOrderProducts({
    required String op_order,
    required List<ProductModel> products,
  }) async {
    try {
      List<Future<void>> futures = [];
      for (var item in products) {
        futures.add(apiService.httpPost(
          link: Links.linkAddOrderProduct,
          data: {
            'op_order': op_order,
            'op_product': item.productId.toString(),
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
  Future<Either<Failures, List<QuizModel>>> viewStudentQuizzes({
    required String student_id,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkViewStudentQuizzes,
        data: {
          'student_id': student_id,
        },
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures(response['message']));
      } else {
        List<QuizModel> quizzes = [];

        for (var item in response['data']) {
          quizzes.add(QuizModel.fromJson(item));
        }

        return right(quizzes);
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
  Future<Either<Failures, List<QuestionModel>>> viewQuizQuestions({
    required String question_quiz,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkViewQuizQuestions,
        data: {
          'question_quiz': question_quiz,
        },
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures(response['message']));
      } else {
        List<QuestionModel> questions = [];

        for (var item in response['data']) {
          questions.add(QuestionModel.fromJson(item));
        }

        return right(questions);
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
  Future<Either<Failures, String>> submitQuiz({
    required String qd_quiz,
    required String qd_student,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkSubmitQuiz,
        data: {
          'qd_quiz': qd_quiz,
          'qd_student': qd_student,
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
  Future<Either<Failures, String>> increasePracticalDegree({
    required String std_degree,
    required String subject_degree,
    required String increase_by,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkIncreasePracticalDegree,
        data: {
          'std_degree': std_degree,
          'subject_degree': subject_degree,
          'increase_by': increase_by,
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
}
