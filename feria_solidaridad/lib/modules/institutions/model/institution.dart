import 'dart:convert';

import 'package:feria_solidaridad/modules/projects/model/project.dart';

class Institution {
  String name;
  String? imageUrl;
  String description;
  List<String> images;
  String? location;
  String aboutUs;
  String objective;
  String mission;
  String vision;
  String? videoId;
  List<Project> projects;
  List<String> contacts;

  Institution({
    required this.name,
    this.imageUrl,
    required this.description,
    required this.images,
    this.location,
    required this.aboutUs,
    required this.objective,
    required this.mission,
    required this.vision,
    this.videoId,
    required this.projects,
    required this.contacts,
  });

  // Placeholder constructor
  Institution.placeholder()
      : name = "",
        description = "",
        images = [],
        aboutUs = "",
        objective = "",
        mission = "",
        vision = "",
        projects = [],
        contacts = [];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'images': images,
      'location': location,
      'aboutUs': aboutUs,
      'objective': objective,
      'mission': mission,
      'vision': vision,
      'videoId': videoId,
      'projects': projects.map((x) => x.toMap()).toList(),
      'contacts': contacts,
    };
  }

  factory Institution.fromMap(Map<String, dynamic> map) {
    return Institution(
        name: map['name'] as String,
        imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
        description: map['description'] as String,
        images: List<String>.from(map['images'] as List<String>),
        location: map['location'] != null ? map['location'] as String : null,
        aboutUs: map['aboutUs'] as String,
        objective: map['objective'] as String,
        mission: map['mission'] as String,
        vision: map['vision'] as String,
        videoId: map['videoId'] != null ? map['videoId'] as String : null,
        projects: List<Project>.from(
          (map['projects'] as List<int>).map<Project>(
            (x) => Project.fromMap(x as Map<String, dynamic>),
          ),
        ),
        contacts: List<String>.from(
          (map['contacts'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Institution.fromJson(String source) =>
      Institution.fromMap(json.decode(source) as Map<String, dynamic>);
}
