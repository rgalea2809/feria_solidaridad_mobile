import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ImagesResponse {
  List<ImagesData> data;
  int statusCode;

  ImagesResponse({
    required this.data,
    required this.statusCode,
  });

  ImagesResponse.empty()
      : data = [],
        statusCode = 200;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.map((x) => x.toMap()).toList(),
      'statusCode': statusCode,
    };
  }

  factory ImagesResponse.fromMap(Map<String, dynamic> map) {
    return ImagesResponse(
      data: List<ImagesData>.from(
        (map['data'] as List<dynamic>).map<ImagesData>(
          (x) => ImagesData.fromMap(x as Map<String, dynamic>),
        ),
      ),
      statusCode: map['statusCode'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImagesResponse.fromJson(String source) =>
      ImagesResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ImagesData {
  String url;
  String alt;
  ImagesData({
    required this.url,
    required this.alt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'alt': alt,
    };
  }

  factory ImagesData.fromMap(Map<String, dynamic> map) {
    return ImagesData(
      url: map['url'] as String,
      alt: map['alt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImagesData.fromJson(String source) =>
      ImagesData.fromMap(json.decode(source) as Map<String, dynamic>);
}
