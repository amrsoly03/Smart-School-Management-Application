import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures.dart';
import '../models/student_model.dart';

abstract class StudentRepo {

  Future<Either<Failures, StudentModel>> studentLogin({
    required String student_Id,
    required String student_password,
  });
}
