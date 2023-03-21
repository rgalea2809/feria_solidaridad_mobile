import 'dart:convert';

class ContactData {
  String type;
  String data;

  ContactData({
    required this.type,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'type': type});
    result.addAll({'data': data});

    return result;
  }

  factory ContactData.fromMap(Map<String, dynamic> map) {
    return ContactData(
      type: map['type'] ?? '',
      data: map['data'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactData.fromJson(String source) =>
      ContactData.fromMap(json.decode(source));
}
