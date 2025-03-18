import '../../../../Core/utils/api_service.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  // Future<Either<Failures, UserModel>> login(
  //     {required String email, required String password}) async {
  //   try {
  //     Map<String, dynamic> response = await apiService.httpPost(
  //       link: Links.linkLogin,
  //       data: {
  //         'email': email,
  //         'password': password,
  //       },
  //     );
  //     log('response: $response');
  //     if (response['status'] == 'failed') {
  //       return left(ServerFailures('something went wrong, try again'));
  //     } else {
  //       UserModel user = UserModel.fromJson(response['data']);
  //       return right(user);
  //     }
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailures.fromDioError(e));
  //     } else if (e is SocketException) {
  //       return left(ServerFailures('No internet connection'));
  //     }
  //     log('e: $e');
  //     return left(ServerFailures('something went wrong'));
  //   }
  // }
}
