abstract class Failures {
  final String errMessage;

  Failures(this.errMessage);
}

class ServerFailures extends Failures {
  ServerFailures(super.errMessage);

  factory ServerFailures.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailures(response['errors']['message']);
    } else if (statusCode == 404) {
      return ServerFailures('your request not found');
    } else if (statusCode == 500) {
      return ServerFailures('internal server error, please try again');
    } else {
      return ServerFailures('unexpected error, please try again');
    }
  }
}
