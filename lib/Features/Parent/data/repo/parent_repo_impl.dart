import 'package:nexura/Features/Parent/data/repo/parent_repo.dart';

import '../../../../Core/utils/api_service.dart';

class ParentRepoImpl implements ParentRepo {
  final ApiService apiService;

  ParentRepoImpl(this.apiService);
}
