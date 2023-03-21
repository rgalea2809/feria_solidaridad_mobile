import 'dart:convert';

import 'package:feria_solidaridad/modules/institutions/model/contact_data.dart';
import 'package:feria_solidaridad/modules/institutions/model/institution_preview.dart';

class Project {
  int id;
  String title;
  String imageUrl;
  String description;
  String modality;
  String place;
  int hours;
  int vacants;
  String formUrl;
  List<String> activities;
  List<String> requirements;
  List<String> schedules;
  List<ContactData> contacts;
  InstitutionPreview institution;

  Project({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.modality,
    required this.place,
    required this.hours,
    required this.vacants,
    required this.formUrl,
    required this.activities,
    required this.requirements,
    required this.schedules,
    required this.contacts,
    required this.institution,
  });

  Project.empty()
      : id = 0,
        title = "",
        imageUrl = "",
        description = "",
        modality = "",
        place = "",
        hours = 0,
        vacants = 0,
        formUrl = "",
        activities = [],
        requirements = [],
        schedules = [],
        contacts = [],
        institution = InstitutionPreview.empty();

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'description': description});
    result.addAll({'modality': modality});
    result.addAll({'place': place});
    result.addAll({'hours': hours});
    result.addAll({'vacants': vacants});
    result.addAll({'formUrl': formUrl});
    result.addAll({'activities': activities});
    result.addAll({'requirements': requirements});
    result.addAll({'schedules': schedules});
    result.addAll({'contacts': contacts.map((x) => x.toMap()).toList()});
    result.addAll({'institution': institution.toMap()});

    return result;
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      description: map['description'] ?? '',
      modality: map['modality'] ?? '',
      place: map['place'] ?? '',
      hours: map['hours']?.toInt() ?? 0,
      vacants: map['vacants']?.toInt() ?? 0,
      formUrl: map['formUrl'] ?? '',
      activities: List<String>.from(map['activities']),
      requirements: List<String>.from(map['requirements']),
      schedules: List<String>.from(map['schedules']),
      contacts: List<ContactData>.from(
          map['contacts']?.map((x) => ContactData.fromMap(x))),
      institution: InstitutionPreview.fromMap(map['institution']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source));
}
