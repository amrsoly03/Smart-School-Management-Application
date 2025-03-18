import 'package:nexura/Features/Admin/data/repo/admin_repo.dart';

import '../../../../Core/utils/api_service.dart';

class AdminRepoImpl implements AdminRepo {
  final ApiService apiService;

  AdminRepoImpl(this.apiService);
}
