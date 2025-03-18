import 'package:nexura/Features/Student/data/repo/student_repo.dart';

import '../../../../Core/utils/api_service.dart';

class StudentRepoImpl implements StudentRepo {
  final ApiService apiService;

  StudentRepoImpl(this.apiService);
}
