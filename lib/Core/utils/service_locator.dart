import 'package:get_it/get_it.dart';
import 'package:nexura/Features/Admin/data/repo/admin_repo_impl.dart';

import 'api_service.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService());

  getIt.registerSingleton<AdminRepoImpl>(
    AdminRepoImpl(getIt.get<ApiService>()),
  );

  // getIt.registerSingleton<HomeRepoImpl>(
  //   HomeRepoImpl(getIt.get<ApiService>()),
  // );
}
