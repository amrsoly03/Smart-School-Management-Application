import 'package:get_it/get_it.dart';


import 'api_service.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService());

  // getIt.registerSingleton<AuthRepoImpl>(
  //   AuthRepoImpl(getIt.get<ApiService>()),
  // );

}
