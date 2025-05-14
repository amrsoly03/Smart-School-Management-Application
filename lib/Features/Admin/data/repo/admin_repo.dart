import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures.dart';
import '../models/admin_model.dart';

abstract class AdminRepo {
  Future<Either<Failures, AdminModel>> adminLogin({
    required String email,
    required String admin_password,
  });

  Future<Either<Failures, String>> createUser({
    required String s_name,
    required String email,
    required String student_password,
    required String parent_password,
    required String grade,
  });

  Future<Either<Failures, String>> sendReport({
    required String std_report,
    required String content,
  });
}
