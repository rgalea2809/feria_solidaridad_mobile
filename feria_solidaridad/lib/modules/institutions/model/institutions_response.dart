// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:feria_solidaridad/modules/institutions/model/institution.dart';

class InstitutionsResponse {
  Institution data;
  int statusCode;
  String? error;
  String? message;

  InstitutionsResponse({
    required this.data,
    required this.statusCode,
    this.error,
    this.message,
  });

  InstitutionsResponse.empty()
      : data = Institution.empty(),
        statusCode = 200;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'data': data.toMap()});
    result.addAll({'statusCode': statusCode});
    if (error != null) {
      result.addAll({'error': error});
    }
    if (message != null) {
      result.addAll({'message': message});
    }

    return result;
  }

  factory InstitutionsResponse.fromMap(Map<String, dynamic> map) {
    return InstitutionsResponse(
      data: Institution.fromMap(map['data']),
      statusCode: map['statusCode']?.toInt() ?? 0,
      error: map['error'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InstitutionsResponse.fromJson(String source) =>
      InstitutionsResponse.fromMap(json.decode(source));
}
