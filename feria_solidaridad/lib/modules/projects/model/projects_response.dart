import 'dart:convert';
import 'package:feria_solidaridad/modules/projects/model/project.dart';

class ProjectsResponse {
  List<Project> projects;
  int numberOfPages;
  ProjectsResponse({
    required this.projects,
    required this.numberOfPages,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'projects': projects.map((x) => x.toMap()).toList(),
      'numberOfPages': numberOfPages,
    };
  }

  factory ProjectsResponse.fromMap(Map<String, dynamic> map) {
    return ProjectsResponse(
      projects: List<Project>.from(
        (map['projects'] as List<int>).map<Project>(
          (x) => Project.fromMap(x as Map<String, dynamic>),
        ),
      ),
      numberOfPages: map['numberOfPages'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectsResponse.fromJson(String source) =>
      ProjectsResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
