import 'package:feria_solidaridad/constants/app_constants.dart';
import 'package:feria_solidaridad/modules/projects/model/project.dart';
import 'package:feria_solidaridad/modules/projects/model/projects_response.dart';
import 'package:feria_solidaridad/networking/network_request.dart';
import 'package:feria_solidaridad/networking/network_request_body.dart';
import 'package:feria_solidaridad/networking/network_response.dart';
import 'package:feria_solidaridad/networking/network_service.dart';

abstract class ProjectsServiceType {
  Future<ProjectsResponse> fetchProjectsData(int page);
}

class ProjectsService implements ProjectsServiceType {
  NetworkServiceType networkService;

  ProjectsService({required this.networkService});

  @override
  Future<ProjectsResponse> fetchProjectsData(int page) async {
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: kApiPaths[ApiPath.getAllProjects] ?? "",
      data: NetworkRequestBody.empty(),
      queryParams: {'page': page},
    );

    NetworkResponse response = await networkService.execute(request);

    if (response.data == null) {
      return ProjectsResponse.empty();
    }

    return ProjectsResponse.fromMap(response.data!);
  }
}

class ProjectsServiceMock implements ProjectsServiceType {
  @override
  Future<ProjectsResponse> fetchProjectsData(int page) async {
    List<Project> projects = [];

    for (int i = 0; i < 10; i++) {
      projects.add(
        Project(
          id: i,
          title: "Proyecto #$i| Pg.$page",
          modality: i % 2 == 0 ? "Presencial" : "Virtual",
          imageUrl: "",
          hours: 10,
        ),
      );
    }

    return ProjectsResponse.empty();
  }
}
