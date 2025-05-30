import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:nexura/Core/models/parent_model.dart';
import 'package:nexura/Features/Parent/data/repo/parent_repo.dart';

import '../../../../Core/errors/failures.dart';
import '../../../../Core/utils/api_service.dart';
import '../../../../Core/utils/links.dart';

class ParentRepoImpl implements ParentRepo {
  final ApiService apiService;

  ParentRepoImpl(this.apiService);

  Future<Either<Failures, ParentModel>> parentLogin({
    required String student_id,
    required String parent_password,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkParentLogin,
        data: {
          'student_id': student_id,
          'parent_password': parent_password,
        },
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures('something went wrong, try again'));
      } else {
        ParentModel parentModel = ParentModel.fromJson(response['data']);
        return right(parentModel);
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
