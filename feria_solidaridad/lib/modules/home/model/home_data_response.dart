import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HomeDataResponse {
  int statusCode;
  HomeDataResponseData data;

  HomeDataResponse({
    required this.statusCode,
    required this.data,
  });

  HomeDataResponse.empty()
      : data = HomeDataResponseData.empty(),
        statusCode = 200;

  factory HomeDataResponse.fromMap(Map<String, dynamic> map) {
    return HomeDataResponse(
      statusCode: map['statusCode'] as int,
      data: HomeDataResponseData.fromMap(map['data']),
    );
  }

  factory HomeDataResponse.fromJson(String source) =>
      HomeDataResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

class HomeDataResponseData {
  String logoHomeUrl;
  String videoHomeUrl;
  String message;
  String messageAuthor;
  String yearEdition;

  String get videoId {
    final a = Uri.parse(videoHomeUrl);
    print(a.path);
    return a.path;
  }

  HomeDataResponseData({
    required this.logoHomeUrl,
    required this.videoHomeUrl,
    required this.message,
    required this.messageAuthor,
    required this.yearEdition,
  });

  HomeDataResponseData.empty()
      : logoHomeUrl = "",
        videoHomeUrl = "",
        message = "",
        messageAuthor = "",
        yearEdition = "";

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'logo_home_url': logoHomeUrl,
      'video_home_url': videoHomeUrl,
      'message': message,
      'message_author': messageAuthor,
      'year_edition': yearEdition,
    };
  }

  factory HomeDataResponseData.fromMap(Map<String, dynamic> map) {
    return HomeDataResponseData(
      logoHomeUrl: map['logo_home_url'] as String,
      videoHomeUrl: map['video_home_url'] as String,
      message: map['message'] as String,
      messageAuthor: map['message_author'] as String,
      yearEdition: map['year_edition'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeDataResponseData.fromJson(String source) =>
      HomeDataResponseData.fromMap(json.decode(source) as Map<String, dynamic>);
}
