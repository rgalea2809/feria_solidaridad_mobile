import 'dart:convert';

class Project {
  int id;
  String title;
  String imageUrl;
  String modality;
  int hours;

  Project({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.modality,
    required this.hours,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'modality': modality});
    result.addAll({'hours': hours});

    return result;
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      modality: map['modality'] ?? '',
      hours: map['hours']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source));
}
