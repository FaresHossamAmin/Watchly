import 'package:watchly/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}

class LocalException implements Exception {
  final String errorMessage;

  LocalException({required this.errorMessage});
}
