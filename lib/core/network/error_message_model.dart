import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String statusMessage;
  final int statusCode;
  final bool success;

  const ErrorMessageModel({
    required this.statusMessage,
    required this.statusCode,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> jsonError) =>
      ErrorMessageModel(
        statusCode: jsonError['statusCode'],
        statusMessage: jsonError['statusMessage'],
        success: jsonError['success'],
      );

  @override
  List<Object?> get props => [statusMessage, statusCode, success];
}
