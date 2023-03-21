import 'dart:convert';

class InstitutionPreview {
  int id;
  String name;
  String logoUrl;
  String aboutUs;

  InstitutionPreview({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.aboutUs,
  });

  InstitutionPreview.empty()
      : id = 0,
        name = "",
        logoUrl = "",
        aboutUs = "";

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'logoUrl': logoUrl});
    result.addAll({'aboutUs': aboutUs});

    return result;
  }

  factory InstitutionPreview.fromMap(Map<String, dynamic> map) {
    return InstitutionPreview(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      logoUrl: map['logoUrl'] ?? '',
      aboutUs: map['aboutUs'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InstitutionPreview.fromJson(String source) =>
      InstitutionPreview.fromMap(json.decode(source));
}
