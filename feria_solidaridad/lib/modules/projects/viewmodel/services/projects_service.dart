import 'package:feria_solidaridad/constants/app_constants.dart';
import 'package:feria_solidaridad/modules/projects/model/project.dart';
import 'package:feria_solidaridad/modules/projects/model/projects_response.dart';
import 'package:feria_solidaridad/networking/network_request.dart';
import 'package:feria_solidaridad/networking/network_request_body.dart';
import 'package:feria_solidaridad/networking/network_response.dart';
import 'package:feria_solidaridad/networking/network_service.dart';

abstract class ProjectsServiceType {
  Future<ProjectsResponse> fetchProjectData(int id);
}

class ProjectsService implements ProjectsServiceType {
  NetworkServiceType networkService;

  ProjectsService({required this.networkService});

  @override
  Future<ProjectsResponse> fetchProjectData(int id) async {
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: "${kApiPaths[ApiPath.getAllProjects]}/$id",
      data: NetworkRequestBody.empty(),
    );

    NetworkResponse response = await networkService.execute(request);

    if (response.data == null) {
      return ProjectsResponse.empty();
    }

    return ProjectsResponse.fromMap(response.data!);
  }
}
