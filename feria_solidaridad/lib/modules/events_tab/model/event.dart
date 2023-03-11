import 'dart:convert';

class Event {
  String name;
  String type;
  String hyperlink;
  String? imageUrl;

  Event({
    required this.name,
    required this.type,
    required this.hyperlink,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'type': type});
    result.addAll({'hyperlink': hyperlink});
    if (imageUrl != null) {
      result.addAll({'imageUrl': imageUrl});
    }

    return result;
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      name: map['name'] ?? '',
      type: map['type'] ?? '',
      hyperlink: map['hyperlink'] ?? '',
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) => Event.fromMap(json.decode(source));
}
