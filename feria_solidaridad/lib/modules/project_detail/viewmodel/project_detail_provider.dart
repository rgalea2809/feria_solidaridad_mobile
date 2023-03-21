import 'package:feria_solidaridad/modules/core/core_services/url_launcher_service.dart';
import 'package:feria_solidaridad/modules/institutions/model/project_preview.dart';
import 'package:feria_solidaridad/modules/projects/model/project.dart';
import 'package:feria_solidaridad/modules/projects/model/projects_response.dart';
import 'package:feria_solidaridad/modules/projects/viewmodel/services/projects_service.dart';
import 'package:flutter/material.dart';

class ProjectDetailProvider extends ChangeNotifier {
  ProjectsServiceType projectService;
  UrlLauncherServiceType urlLauncherService;
  ProjectPreview projectPreview;

  ProjectDetailProvider({
    required this.projectService,
    required this.urlLauncherService,
    required this.projectPreview,
  });

  Project? project;
  bool isLoading = false;

  Future<void> fetchProject() async {
    setLoadingState(true);

    ProjectsResponse projectsResponse =
        await projectService.fetchProjectData(projectPreview.id);

    project = projectsResponse.data;

    setLoadingState(false);
  }

  Future<void> launchUrl(String url) async {
    await urlLauncherService.openUrl(url);
  }

  void setLoadingState(bool state) {
    isLoading = state;
    notifyListeners();
  }
}
