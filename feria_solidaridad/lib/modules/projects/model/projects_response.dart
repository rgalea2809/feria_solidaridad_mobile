import 'dart:convert';

import 'package:feria_solidaridad/modules/projects/model/project.dart';

class ProjectsResponse {
  ProjectsResponseData data;
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
      : data = ProjectsResponseData.empty(),
        statusCode = 200;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

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
      data: ProjectsResponseData.fromMap(map['data']),
      statusCode: map['statusCode']?.toInt() ?? 0,
      error: map['error'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectsResponse.fromJson(String source) =>
      ProjectsResponse.fromMap(json.decode(source));
}

class ProjectsResponseData {
  ProjectsResponseMetaData meta;
  List<Project> items;

  ProjectsResponseData({
    required this.meta,
    required this.items,
  });

  ProjectsResponseData.empty()
      : meta = ProjectsResponseMetaData.empty(),
        items = [];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'meta': meta.toMap()});
    result.addAll({'items': items.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ProjectsResponseData.fromMap(Map<String, dynamic> map) {
    return ProjectsResponseData(
      meta: ProjectsResponseMetaData.fromMap(map['meta']),
      items: List<Project>.from(map['items']?.map((x) => Project.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectsResponseData.fromJson(String source) =>
      ProjectsResponseData.fromMap(json.decode(source));
}

class ProjectsResponseMetaData {
  int totalItems;
  int itemCount;
  int itemsPerPage;
  int totalPages;
  int currentPage;

  ProjectsResponseMetaData({
    required this.totalItems,
    required this.itemCount,
    required this.itemsPerPage,
    required this.totalPages,
    required this.currentPage,
  });

  ProjectsResponseMetaData.empty()
      : totalItems = 0,
        itemCount = 0,
        itemsPerPage = 0,
        totalPages = 0,
        currentPage = 0;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'totalItems': totalItems});
    result.addAll({'itemCount': itemCount});
    result.addAll({'itemsPerPage': itemsPerPage});
    result.addAll({'totalPages': totalPages});
    result.addAll({'currentPage': currentPage});

    return result;
  }

  factory ProjectsResponseMetaData.fromMap(Map<String, dynamic> map) {
    return ProjectsResponseMetaData(
      totalItems: map['totalItems']?.toInt() ?? 0,
      itemCount: map['itemCount']?.toInt() ?? 0,
      itemsPerPage: map['itemsPerPage']?.toInt() ?? 0,
      totalPages: map['totalPages']?.toInt() ?? 0,
      currentPage: map['currentPage']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectsResponseMetaData.fromJson(String source) =>
      ProjectsResponseMetaData.fromMap(json.decode(source));
}
