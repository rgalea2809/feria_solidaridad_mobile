import 'dart:convert';

import 'package:feria_solidaridad/modules/projects/model/project.dart';

class ProjectsResponse {
  Project data;
  int statusCode;
  String? error;
  String? message;

  ProjectsResponse({
    required this.data,
    required this.statusCode,
    this.error,
    this.message,
  });

  ProjectsResponse.empty()
      : data = Project.empty(),
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

  factory ProjectsResponse.fromMap(Map<String, dynamic> map) {
    return ProjectsResponse(
      data: Project.fromMap(map['data']),
      statusCode: map['statusCode']?.toInt() ?? 0,
      error: map['error'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectsResponse.fromJson(String source) =>
      ProjectsResponse.fromMap(json.decode(source));
}
