import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures.dart';
import '../../../../Core/models/activity_model.dart';
import '../../../../Core/models/order_model.dart';
import '../../../../Core/models/parent_model.dart';
import '../../../../Core/models/product_model.dart';
import '../../../../Core/models/report_model.dart';

abstract class ParentRepo {
  Future<Either<Failures, ParentModel>> parentLogin({
    required String student_id,
    required String parent_password,
  });

  Future<Either<Failures, String>> parentSendReport({
    required String std_report,
    required String content,
  });

  Future<Either<Failures, List<ReportModel>>> viewParentSentReports({
    required String std_report,
  });

  Future<Either<Failures, int>> viewCoins({
    required String parent_id,
  });

  Future<Either<Failures, List<OrderModel>>> viewPreviousTransactions({
    required String order_student,
    required String order_approved,
  });

  Future<Either<Failures, List<ProductModel>>> viewOrderProducts({
    required String op_order,
  });

  Future<Either<Failures, String>> chargeCoins({
    required String parent_id,
    required String increase_by,
  });

  Future<Either<Failures, int>> viewFees({
    required String student_id,
  });

  Future<Either<Failures, String>> PayFees({
    required String parent_id,
  });

    Future<Either<Failures, String>> approveOrder({
    required String parent_id,
    required String order_id,
    required String total_price,
  });

  Future<Either<Failures, List<ActivityModel>>> viewApproveActivities({
    required String student_id,
  });

  Future<Either<Failures, String>> approveActivity({
    required String parent_id,
    required String student_as,
    required String activity_as,
    required String total_price,
  });
}
