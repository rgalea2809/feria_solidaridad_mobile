// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:feria_solidaridad/modules/projects/model/project.dart';

class Institution {
  int id;
  String name;
  String? logoUrl;
  String? location;
  String? aboutUs;
  String? objective;
  String? mission;
  String? vision;
  String? videoUrl;
  List<Project>? projects;
  List<String>? contacts;

  Institution({
    required this.id,
    required this.name,
    this.logoUrl,
    this.location,
    required this.aboutUs,
    required this.objective,
    required this.mission,
    required this.vision,
    this.videoUrl,
    this.projects,
    this.contacts,
  });

  // Placeholder constructor
  Institution.placeholder()
      : id = 0,
        name = "text",
        logoUrl = null,
        aboutUs = "",
        objective = "",
        mission = "",
        vision = "";

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'logoUrl': logoUrl,
      'location': location,
      'aboutUs': aboutUs,
      'objective': objective,
      'mission': mission,
      'vision': vision,
      'videoUrl': videoUrl,
      'projects': projects?.map((x) => x.toMap()).toList(),
      'contacts': contacts,
    };
  }

  factory Institution.fromMap(Map<String, dynamic> map) {
    return Institution(
      id: map['id'] as int,
      name: map['name'] as String,
      logoUrl: map['logoUrl'] != null ? map['logoUrl'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      aboutUs: map['aboutUs'] != null ? map['aboutUs'] as String : null,
      objective: map['objective'] != null ? map['objective'] as String : null,
      mission: map['mission'] != null ? map['mission'] as String : null,
      vision: map['vision'] != null ? map['vision'] as String : null,
      videoUrl: map['videoUrl'] != null ? map['videoUrl'] as String : null,
      projects: map['projects'] != null
          ? List<Project>.from(
              (map['projects'] as List<int>).map<Project?>(
                (x) => Project.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      contacts: map['contacts'] != null
          ? List<String>.from((map['contacts'] as List<String>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Institution.fromJson(String source) =>
      Institution.fromMap(json.decode(source) as Map<String, dynamic>);
}
