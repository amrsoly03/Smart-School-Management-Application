import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:nexura/Core/models/degree_model.dart';
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
}
