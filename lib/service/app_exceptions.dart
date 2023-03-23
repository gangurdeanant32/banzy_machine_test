import 'base_error_response.dart';

class AppException implements Exception {
  final List<ServerErrors>? message;
  final String? prefix;
  final String? url;

  AppException([this.message, this.prefix, this.url]);
}

class BadRequestException extends AppException {
  BadRequestException([List<ServerErrors>? message, String? url]) : super(message, 'Bad Request', url);
}

class FetchDataException extends AppException {
  FetchDataException([List<ServerErrors>? message, String? url]) : super(message, 'Unable to process', url);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException([List<ServerErrors>? message, String? url]) : super(message, 'Api not responded in time', url);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([List<ServerErrors>? message, String? url]) : super(message, 'UnAuthorized request', url);
}