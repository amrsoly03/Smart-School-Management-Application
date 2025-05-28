import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:nexura/Features/Student/data/models/student_model.dart';
import 'package:nexura/Features/Student/data/repo/student_repo.dart';

import '../../../../Core/errors/failures.dart';
import '../../../../Core/utils/api_service.dart';
import '../../../../Core/utils/links.dart';

class StudentRepoImpl implements StudentRepo {
  final ApiService apiService;

  StudentRepoImpl(this.apiService);

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
}
