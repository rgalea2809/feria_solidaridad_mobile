import 'package:feria_solidaridad/constants/app_constants.dart';
import 'package:feria_solidaridad/modules/projects/model/projects_preview_response.dart';
import 'package:feria_solidaridad/networking/network_request.dart';
import 'package:feria_solidaridad/networking/network_request_body.dart';
import 'package:feria_solidaridad/networking/network_response.dart';
import 'package:feria_solidaridad/networking/network_service.dart';

abstract class ProjectsPreviewServiceType {
  Future<ProjectsPreviewResponse> fetchProjectsData(int page);
}

class ProjectsPreviewService implements ProjectsPreviewServiceType {
  NetworkServiceType networkService;

  ProjectsPreviewService({required this.networkService});

  @override
  Future<ProjectsPreviewResponse> fetchProjectsData(int page) async {
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: kApiPaths[ApiPath.getAllProjects] ?? "",
      data: NetworkRequestBody.empty(),
      queryParams: {
        'page': page.toString(),
        'limit': 4.toString(),
      },
    );

    NetworkResponse response = await networkService.execute(request);

    if (response.data == null) {
      return ProjectsPreviewResponse.empty();
    }

    return ProjectsPreviewResponse.fromMap(response.data!);
  }
}
