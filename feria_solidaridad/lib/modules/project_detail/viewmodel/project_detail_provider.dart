import 'package:feria_solidaridad/modules/institutions/model/project_preview.dart';
import 'package:feria_solidaridad/modules/projects/model/project.dart';
import 'package:feria_solidaridad/modules/projects/model/projects_response.dart';
import 'package:feria_solidaridad/modules/projects/viewmodel/services/projects_service.dart';
import 'package:flutter/material.dart';

class ProjectDetailProvider extends ChangeNotifier {
  ProjectsServiceType projectService;
  ProjectPreview projectPreview;

  ProjectDetailProvider({
    required this.projectService,
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

  void setLoadingState(bool state) {
    isLoading = state;
    notifyListeners();
  }
}
