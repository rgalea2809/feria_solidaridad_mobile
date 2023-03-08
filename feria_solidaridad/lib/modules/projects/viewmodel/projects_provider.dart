import 'package:feria_solidaridad/modules/projects/model/project.dart';
import 'package:feria_solidaridad/modules/projects/model/projects_response.dart';
import 'package:feria_solidaridad/modules/projects/viewmodel/services/projects_service.dart';
import 'package:flutter/material.dart';

class ProjectsProvider extends ChangeNotifier {
  // Dependencies
  ProjectsServiceType projectsService;

  // Parameters
  List<Project> currentProjects = [];
  bool isFetchingData = false;
  int currentPage = 1;
  int numberOfPages = 0;

  ProjectsProvider({required this.projectsService});

  Future<void> fetchProjects() async {
    setLoadingState(true);

    ProjectsResponse projectsData =
        await projectsService.fetchProjectsData(currentPage);

    currentProjects.clear();
    currentProjects = projectsData.data.items;
    numberOfPages = projectsData.data.meta.totalPages;

    setLoadingState(false);
  }

  Future<void> changeProjectsPage(int newPage) async {
    currentPage = newPage;
    notifyListeners();

    await fetchProjects();
  }

  void setLoadingState(bool loadingState) {
    isFetchingData = loadingState;
    notifyListeners();
  }
}
