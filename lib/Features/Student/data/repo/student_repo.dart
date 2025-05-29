import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures.dart';
import '../../../../Core/models/degree_model.dart';
import '../../../../Core/models/product_model.dart';
import '../models/student_model.dart';

abstract class StudentRepo {

  Future<Either<Failures, StudentModel>> studentLogin({
    required String student_Id,
    required String student_password,
  });

  Future<Either<Failures, List<DegreeModel>>> viewDegrees({
    required String std_degree,
  });

  Future<Either<Failures, String>> viewSchedule({
    required String grade_id,
  });

  Future<Either<Failures, String>> subscribeActivity({
    required String student_as,
    required String activity_as,
  });

  Future<Either<Failures, List<ProductModel>>> viewProducts({
    required String product_category,
  });
}
