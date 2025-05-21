import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:nexura/Core/models/activity_model.dart';
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
  Future<Either<Failures, AdminModel>> adminLogin(
      {required String email, required String admin_password}) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkAdminLogin,
        data: {
          'email': email,
          'admin_password': admin_password,
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
  Future<Either<Failures, List<ActivityModel>>> viewActivities() async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkViewActivities,
        data: {},
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures('something went wrong, try again'));
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
}
