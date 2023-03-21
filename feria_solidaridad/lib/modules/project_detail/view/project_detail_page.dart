import 'package:feria_solidaridad/constants/debug_constants.dart';
import 'package:feria_solidaridad/constants/theme_constants.dart';
import 'package:feria_solidaridad/modules/institutions/model/project_preview.dart';
import 'package:feria_solidaridad/modules/projects/model/project.dart';
import 'package:feria_solidaridad/widgets/image_loader.dart';
import 'package:flutter/material.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({
    super.key,
    required this.project,
  });

  final ProjectPreview project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ProjectDetailPageBody(
        project: project,
      ),
    );
  }
}

class ProjectDetailPageBody extends StatelessWidget {
  const ProjectDetailPageBody({super.key, required this.project});

  final ProjectPreview project;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                "Nombre de institucion",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(kLoremParagraph),
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
                [
                  "Actividad 1 asdasd asdsad sdsd sdsd dsd sd ds sdsd sdsdsdsd sdsdsdsdsd sdsdsdsd sdsdsdsd",
                  "Actividad 2 asds dsd dss dsdsd ssdd"
                ],
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
                [
                  "Parametro de estudiante 1",
                  "Parametro de estudiante 2 asd sdsd sdsd sdsd",
                  "Parametro de estudiante 3"
                ],
              ),
              const SizedBox(
                height: 32.0,
              ),
            ],
          ),
        ),
      ],
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

  Widget _richTextSection(String prefix, String sufix) {
    return Container();
    //return RichText(text: Text(""))
  }
}
