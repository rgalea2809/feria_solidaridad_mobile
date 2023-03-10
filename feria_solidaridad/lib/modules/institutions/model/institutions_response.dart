// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:feria_solidaridad/modules/institutions/model/institution.dart';

class InstitutionsResponse {
  InstitutionsResponseData data;
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
      : data = InstitutionsResponseData.empty(),
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

  factory InstitutionsResponse.fromMap(Map<String, dynamic> map) {
    return InstitutionsResponse(
      data: InstitutionsResponseData.fromMap(map['data']),
      statusCode: map['statusCode']?.toInt() ?? 0,
      error: map['error'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InstitutionsResponse.fromJson(String source) =>
      InstitutionsResponse.fromMap(json.decode(source));
}

class InstitutionsResponseData {
  InstitutionsResponseMetaData meta;
  List<Institution> items;

  InstitutionsResponseData({
    required this.meta,
    required this.items,
  });

  InstitutionsResponseData.empty()
      : meta = InstitutionsResponseMetaData.empty(),
        items = [];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'meta': meta.toMap()});
    result.addAll({'items': items.map((x) => x.toMap()).toList()});

    return result;
  }

  factory InstitutionsResponseData.fromMap(Map<String, dynamic> map) {
    return InstitutionsResponseData(
      meta: InstitutionsResponseMetaData.fromMap(map['meta']),
      items: List<Institution>.from(
          map['items']?.map((x) => Institution.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory InstitutionsResponseData.fromJson(String source) =>
      InstitutionsResponseData.fromMap(json.decode(source));
}

class InstitutionsResponseMetaData {
  int totalItems;
  int itemCount;
  int itemsPerPage;
  int totalPages;
  int currentPage;

  InstitutionsResponseMetaData({
    required this.totalItems,
    required this.itemCount,
    required this.itemsPerPage,
    required this.totalPages,
    required this.currentPage,
  });

  InstitutionsResponseMetaData.empty()
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

  factory InstitutionsResponseMetaData.fromMap(Map<String, dynamic> map) {
    return InstitutionsResponseMetaData(
      totalItems: map['totalItems']?.toInt() ?? 0,
      itemCount: map['itemCount']?.toInt() ?? 0,
      itemsPerPage: map['itemsPerPage']?.toInt() ?? 0,
      totalPages: map['totalPages']?.toInt() ?? 0,
      currentPage: map['currentPage']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory InstitutionsResponseMetaData.fromJson(String source) =>
      InstitutionsResponseMetaData.fromMap(json.decode(source));
}
