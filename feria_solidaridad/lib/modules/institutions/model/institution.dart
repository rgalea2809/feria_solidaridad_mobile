// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:feria_solidaridad/modules/institutions/model/contact_data.dart';
import 'package:feria_solidaridad/modules/institutions/model/image_data.dart';
import 'package:feria_solidaridad/modules/institutions/model/project_preview.dart';
import 'package:feria_solidaridad/modules/projects/model/project.dart';

class Institution {
  int id;
  String name;
  String aboutUs;
  String objective;
  String mission;
  String vision;
  String videoUrl;
  List<ProjectPreview> projects;
  List<ImageData> images;
  List<ContactData> contacts;

  Institution({
    required this.id,
    required this.name,
    required this.aboutUs,
    required this.objective,
    required this.mission,
    required this.vision,
    required this.videoUrl,
    required this.projects,
    required this.images,
    required this.contacts,
  });

  Institution.empty()
      : id = 0,
        name = "",
        aboutUs = "",
        objective = "",
        mission = "",
        vision = "",
        videoUrl = "",
        projects = [],
        images = [],
        contacts = [];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'aboutUs': aboutUs});
    result.addAll({'objective': objective});
    result.addAll({'mission': mission});
    result.addAll({'vision': vision});
    result.addAll({'videoUrl': videoUrl});
    result.addAll({'projects': projects.map((x) => x.toMap()).toList()});
    result.addAll({'images': images.map((x) => x.toMap()).toList()});
    result.addAll({'contacts': contacts.map((x) => x.toMap()).toList()});

    return result;
  }

  factory Institution.fromMap(Map<String, dynamic> map) {
    return Institution(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      aboutUs: map['aboutUs'] ?? '',
      objective: map['objective'] ?? '',
      mission: map['mission'] ?? '',
      vision: map['vision'] ?? '',
      videoUrl: map['videoUrl'] ?? '',
      projects: List<ProjectPreview>.from(
          map['projects']?.map((x) => ProjectPreview.fromMap(x))),
      images:
          List<ImageData>.from(map['images']?.map((x) => ImageData.fromMap(x))),
      contacts: List<ContactData>.from(
          map['contacts']?.map((x) => ContactData.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Institution.fromJson(String source) =>
      Institution.fromMap(json.decode(source));
}
