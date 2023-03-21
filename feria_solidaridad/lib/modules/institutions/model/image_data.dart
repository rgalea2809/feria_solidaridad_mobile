import 'dart:convert';

class ImageData {
  String url;
  String alt;

  ImageData({
    required this.url,
    required this.alt,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'url': url});
    result.addAll({'alt': alt});

    return result;
  }

  factory ImageData.fromMap(Map<String, dynamic> map) {
    return ImageData(
      url: map['url'] ?? '',
      alt: map['alt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageData.fromJson(String source) =>
      ImageData.fromMap(json.decode(source));
}
