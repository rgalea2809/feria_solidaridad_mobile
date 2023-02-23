import 'package:feria_solidaridad/modules/projects/model/project.dart';
import 'package:feria_solidaridad/modules/projects/model/projects_response.dart';

abstract class ProjectsServiceType {
  Future<ProjectsResponse> fetchProjectsData(int page);
}

class ProjectsServiceMock implements ProjectsServiceType {
  @override
  Future<ProjectsResponse> fetchProjectsData(int page) async {
    List<Project> projects = [];

    for (int i = 0; i < 10; i++) {
      projects.add(
        Project(
          name: "Proyecto #$i| Pg.$page",
          modality: i % 2 == 0 ? "Presencial" : "Virtual",
          hours: 10,
        ),
      );
    }

    return ProjectsResponse(projects: projects, numberOfPages: 10);
  }
}
