import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures.dart';
import '../../../../Core/models/parent_model.dart';
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
}
