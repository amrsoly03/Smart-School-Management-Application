import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures.dart';
import '../../../../Core/models/parent_model.dart';

abstract class ParentRepo {
  
  Future<Either<Failures, ParentModel>> parentLogin({
    required String student_id,
    required String parent_password,
  });
  
}
