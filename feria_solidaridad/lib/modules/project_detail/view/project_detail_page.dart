import 'package:feria_solidaridad/constants/app_constants.dart';
import 'package:feria_solidaridad/modules/core/core_services/url_launcher_service.dart';
import 'package:feria_solidaridad/modules/institutions/model/project_preview.dart';
import 'package:feria_solidaridad/modules/project_detail/viewmodel/project_detail_provider.dart';
import 'package:feria_solidaridad/modules/projects/model/project.dart';
import 'package:feria_solidaridad/modules/projects/viewmodel/services/projects_service.dart';
import 'package:feria_solidaridad/networking/network_service.dart';
import 'package:feria_solidaridad/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({
    super.key,
    required this.project,
  });

  final ProjectPreview project;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProjectDetailProvider(
        projectService: ProjectsService(
          networkService: NetworkService(
            baseUrl: kApiBaseUrl,
          ),
        ),
        urlLauncherService: UrlLauncherService(),
        projectPreview: project,
      )..fetchProject(),
      child: Scaffold(
        appBar: AppBar(),
        body: Consumer<ProjectDetailProvider>(builder: (context, state, _) {
          Project? currentProject = state.project;
          if (currentProject != null) {
            return ProjectDetailPageBody(
              project: currentProject,
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}

class ProjectDetailPageBody extends StatelessWidget {
  const ProjectDetailPageBody({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            constraints: const BoxConstraints(maxHeight: 150),
            child: ImageLoader(
              imageUrl: project.imageUrl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    project.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: Colors.black.withAlpha(155)),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  project.institution.name,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(project.description),
                const SizedBox(
                  height: 32.0,
                ),
                Text(
                  "Actividades a Desarrollar",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                _bulletedSection(
                  project.activities,
                ),
                const SizedBox(
                  height: 32.0,
                ),
                Text(
                  "Perfil del Estudiante",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                _bulletedSection(
                  project.requirements,
                ),
                const SizedBox(
                  height: 32.0,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                _richTextSection(
                  "Modalidad: ",
                  project.modality,
                  context,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                _richTextSection(
                  "Lugar: ",
                  project.place,
                  context,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                _richTextSection(
                  "Cantidad de horas a obtener: ",
                  project.hours.toString(),
                  context,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                _richTextSection(
                  "Número de plazas disponibles: ",
                  project.vacants.toString(),
                  context,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                _richTextSection(
                  "Horario: ",
                  project.schedules.toString(),
                  context,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                _richTextSection(
                  "Contacto: ",
                  project.contacts[0].data,
                  context,
                ),
                const SizedBox(
                  height: 32.0,
                ),
                /*
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<ProjectDetailProvider>(context, listen: false)
                          .launchUrl(project.formUrl);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.person),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text("Aplicar a proyecto"),
                      ],
                    ),
                  ),
                ),*/
                const SizedBox(
                  height: 32.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bulletedSection(List<String> activities) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: activities.map<Widget>((activity) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 6.0),
                child: const Icon(
                  Icons.circle,
                  size: 4,
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Text(
                  activity,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _richTextSection(String prefix, String sufix, BuildContext context) {
    return RichText(
      text: TextSpan(
        text: prefix,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: sufix,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
