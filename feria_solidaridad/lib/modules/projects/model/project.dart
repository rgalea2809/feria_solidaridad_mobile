import 'dart:convert';

class Project {
  String name;
  String modality;
  int hours;

  Project({
    required this.name,
    required this.modality,
    required this.hours,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'modality': modality,
      'hours': hours,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      name: map['name'] as String,
      modality: map['modality'] as String,
      hours: map['hours'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source) as Map<String, dynamic>);
}
