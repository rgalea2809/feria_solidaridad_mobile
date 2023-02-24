import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Institution {
  String name;
  String? imageUrl;
  String description;

  Institution({
    required this.name,
    this.imageUrl,
    required this.description,
  });

  // Placeholder constructor
  Institution.placeholder()
      : name = "",
        description = "";

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
    };
  }

  factory Institution.fromMap(Map<String, dynamic> map) {
    return Institution(
      name: map['name'] as String,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Institution.fromJson(String source) =>
      Institution.fromMap(json.decode(source) as Map<String, dynamic>);
}
