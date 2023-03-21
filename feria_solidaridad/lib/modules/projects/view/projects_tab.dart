import 'package:feria_solidaridad/constants/app_constants.dart';
import 'package:feria_solidaridad/constants/theme_constants.dart';
import 'package:feria_solidaridad/modules/institutions/model/project_preview.dart';
import 'package:feria_solidaridad/modules/project_detail/view/project_detail_page.dart';
import 'package:feria_solidaridad/modules/projects/viewmodel/projects_provider.dart';
import 'package:feria_solidaridad/modules/projects/viewmodel/services/projects_preview_service.dart';
import 'package:feria_solidaridad/networking/network_service.dart';
import 'package:feria_solidaridad/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectsTab extends StatelessWidget {
  const ProjectsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProjectsProvider(
        projectsService: ProjectsPreviewService(
          networkService: NetworkService(
            baseUrl: kApiBaseUrl,
          ),
        ),
      )..fetchProjects(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Proyectos"),
          backgroundColor: kPrimaryColor,
        ),
        body: const ProjectsList(),
      ),
    );
  }
}

class ProjectsList extends StatelessWidget {
  const ProjectsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectsProvider>(
      builder: (context, state, _) {
        return Column(
          children: [
            getPageIndicator(state.numberOfPages, state.currentPage, context),
            Expanded(
              child: state.currentProjects.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return ProjectListCard(
                          project: state.currentProjects[index],
                        );
                      },
                      itemCount: state.currentProjects.length,
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget getPageIndicator(
    int numberOfPages,
    int currentPage,
    BuildContext context,
  ) {
    Widget numbersSection = Container();

    if (numberOfPages <= 5) {
      numbersSection = Expanded(
        child: Row(
          children: List.generate(
            numberOfPages,
            (page) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${page + 1}",
                  style: Theme.of(context).textTheme.button?.copyWith(
                      fontWeight: currentPage == page + 1
                          ? FontWeight.bold
                          : FontWeight.normal),
                ),
              );
            },
          ),
        ),
      );
    } else {
      if (currentPage == 1 || currentPage == numberOfPages) {
        numbersSection = Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "1",
                style: Theme.of(context).textTheme.button?.copyWith(
                    fontWeight:
                        currentPage == 1 ? FontWeight.bold : FontWeight.normal),
              ),
              const Text("..."),
              Text(
                "$numberOfPages",
                style: Theme.of(context).textTheme.button?.copyWith(
                    fontWeight: currentPage == numberOfPages
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
            ],
          ),
        );
      } else {
        numbersSection = Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "1",
                style: Theme.of(context).textTheme.button?.copyWith(
                      fontWeight: currentPage == 1
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
              ),
              const Text("..."),
              Text(
                "$currentPage",
                style: Theme.of(context).textTheme.button?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Text("..."),
              Text(
                "$numberOfPages",
                style: Theme.of(context).textTheme.button,
              ),
            ],
          ),
        );
      }
    }

    return Row(
      children: [
        IconButton(
          onPressed: currentPage > 1
              ? () {
                  Provider.of<ProjectsProvider>(context, listen: false)
                      .changeProjectsPage(currentPage - 1);
                }
              : null,
          icon: const Icon(Icons.chevron_left),
        ),
        const SizedBox(width: 16),
        numbersSection,
        const SizedBox(width: 16),
        IconButton(
          onPressed: currentPage < numberOfPages
              ? () {
                  Provider.of<ProjectsProvider>(context, listen: false)
                      .changeProjectsPage(currentPage + 1);
                }
              : null,
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}

class ProjectListCard extends StatelessWidget {
  const ProjectListCard({Key? key, required this.project}) : super(key: key);

  final ProjectPreview project;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 350,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 1,
                child: ImageLoader(
                  imageUrl: project.imageUrl,
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          project.title,
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        "Modalidad: ${project.modality}",
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "Horas requeridas: ${project.hours}",
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProjectDetailPage(project: project);
                                },
                              ),
                            );
                          },
                          child: const Text("Ver más"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
