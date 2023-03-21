// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:feria_solidaridad/modules/institutions/model/institution_preview.dart';

class InstitutionsPreviewResponse {
  InstitutionsPreviewResponseData data;
  int statusCode;
  String? error;
  String? message;

  InstitutionsPreviewResponse({
    required this.data,
    required this.statusCode,
    this.error,
    this.message,
  });

  InstitutionsPreviewResponse.empty()
      : data = InstitutionsPreviewResponseData.empty(),
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

  factory InstitutionsPreviewResponse.fromMap(Map<String, dynamic> map) {
    return InstitutionsPreviewResponse(
      data: InstitutionsPreviewResponseData.fromMap(map['data']),
      statusCode: map['statusCode']?.toInt() ?? 0,
      error: map['error'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InstitutionsPreviewResponse.fromJson(String source) =>
      InstitutionsPreviewResponse.fromMap(json.decode(source));
}

class InstitutionsPreviewResponseData {
  InstitutionsPreviewResponseMetaData meta;
  List<InstitutionPreview> items;

  InstitutionsPreviewResponseData({
    required this.meta,
    required this.items,
  });

  InstitutionsPreviewResponseData.empty()
      : meta = InstitutionsPreviewResponseMetaData.empty(),
        items = [];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'meta': meta.toMap()});
    result.addAll({'items': items.map((x) => x.toMap()).toList()});

    return result;
  }

  factory InstitutionsPreviewResponseData.fromMap(Map<String, dynamic> map) {
    return InstitutionsPreviewResponseData(
      meta: InstitutionsPreviewResponseMetaData.fromMap(map['meta']),
      items: List<InstitutionPreview>.from(
          map['items']?.map((x) => InstitutionPreview.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory InstitutionsPreviewResponseData.fromJson(String source) =>
      InstitutionsPreviewResponseData.fromMap(json.decode(source));
}

class InstitutionsPreviewResponseMetaData {
  int totalItems;
  int itemCount;
  int itemsPerPage;
  int totalPages;
  int currentPage;

  InstitutionsPreviewResponseMetaData({
    required this.totalItems,
    required this.itemCount,
    required this.itemsPerPage,
    required this.totalPages,
    required this.currentPage,
  });

  InstitutionsPreviewResponseMetaData.empty()
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

  factory InstitutionsPreviewResponseMetaData.fromMap(
      Map<String, dynamic> map) {
    return InstitutionsPreviewResponseMetaData(
      totalItems: map['totalItems']?.toInt() ?? 0,
      itemCount: map['itemCount']?.toInt() ?? 0,
      itemsPerPage: map['itemsPerPage']?.toInt() ?? 0,
      totalPages: map['totalPages']?.toInt() ?? 0,
      currentPage: map['currentPage']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory InstitutionsPreviewResponseMetaData.fromJson(String source) =>
      InstitutionsPreviewResponseMetaData.fromMap(json.decode(source));
}
