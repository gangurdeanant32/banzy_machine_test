// To parse this JSON data, do
//
//     final baseErrorResponse = baseErrorResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BaseErrorResponse baseErrorResponseFromJson(String str) => BaseErrorResponse.fromJson(json.decode(str));

String baseErrorResponseToJson(BaseErrorResponse data) => json.encode(data.toJson());

class BaseErrorResponse {
  BaseErrorResponse({
    required this.errors,
  });

  List<ServerErrors> errors;

  factory BaseErrorResponse.fromJson(Map<String, dynamic> json) => BaseErrorResponse(
    errors: List<ServerErrors>.from(json["errors"].map((x) => ServerErrors.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
  };
}

class ServerErrors {
  ServerErrors({
    required this.code,
    required this.message,
  });

  String code;
  String message;

  factory ServerErrors.fromJson(Map<String, dynamic> json) => ServerErrors(
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
  };
}
