import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:nexura/Core/models/activity_model.dart';
import 'package:nexura/Core/models/order_model.dart';
import 'package:nexura/Core/models/parent_model.dart';
import 'package:nexura/Features/Parent/data/repo/parent_repo.dart';

import '../../../../Core/errors/failures.dart';
import '../../../../Core/models/product_model.dart';
import '../../../../Core/models/report_model.dart';
import '../../../../Core/utils/api_service.dart';
import '../../../../Core/utils/links.dart';

class ParentRepoImpl implements ParentRepo {
  final ApiService apiService;

  ParentRepoImpl(this.apiService);

  @override
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

  @override
  Future<Either<Failures, String>> parentSendReport({
    required String std_report,
    required String content,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkParentSendReport,
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
  Future<Either<Failures, List<ReportModel>>> viewParentSentReports(
      {required String std_report}) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkViewParentSentReports,
        data: {
          'std_report': std_report,
        },
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
  Future<Either<Failures, int>> viewCoins({
    required String parent_id,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkViewCoins,
        data: {
          'parent_id': parent_id,
        },
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures(response['message']));
      } else {
        return right(response['data']['coins']);
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
  Future<Either<Failures, List<OrderModel>>> viewPreviousTransactions({
    required String order_student,
    required String order_approved,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkViewPreviousTransactions,
        data: {
          'order_student': order_student,
          'order_approved': order_approved,
        },
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures(response['message']));
      } else {
        List<OrderModel> orders = [];

        for (var item in response['data']) {
          orders.add(OrderModel.fromJson(item));
        }

        return right(orders);
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
  Future<Either<Failures, List<ProductModel>>> viewOrderProducts({
    required String op_order,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkViewOrderProducts,
        data: {
          'op_order': op_order,
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
  Future<Either<Failures, String>> chargeCoins({
    required String parent_id,
    required String increase_by,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkChargeCoins,
        data: {
          'parent_id': parent_id,
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

  @override
  Future<Either<Failures, int>> viewFees({
    required String student_id,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkViewFees,
        data: {
          'student_id': student_id,
        },
      );

      log('response: $response');

      if (response['status'] == 'failed') {
        return left(ServerFailures(response['message']));
      } else {
        return right(response['data']['fees']);
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
  Future<Either<Failures, String>> PayFees({
    required String parent_id,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkPayFees,
        data: {
          'parent_id': parent_id,
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
  Future<Either<Failures, String>> approveOrder({
    required String parent_id,
    required String order_id,
    required String total_price,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkApproveOrder,
        data: {
          'parent_id': parent_id,
          'order_id': order_id,
          'total_price': total_price
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

  
    Future<Either<Failures, List<ActivityModel>>> viewApproveActivities({
    required String student_id,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkViewApproveActivities,
        data: {
          'student_id': student_id,
        },
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
  Future<Either<Failures, String>> approveActivity({
    required String parent_id,
    required String student_as,
    required String activity_as,
    required String total_price,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.httpPost(
        link: Links.linkApproveActivity,
        data: {
          'parent_id': parent_id,
          'student_as': student_as,
          'activity_as': activity_as,
          'total_price': total_price
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
