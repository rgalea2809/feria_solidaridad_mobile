import 'package:feria_solidaridad/constants/app_constants.dart';
import 'package:feria_solidaridad/constants/theme_constants.dart';
import 'package:feria_solidaridad/modules/institution_detail/viewmodel/institution_detail_providert.dart';
import 'package:feria_solidaridad/modules/institutions/model/contact_data.dart';
import 'package:feria_solidaridad/modules/institutions/model/institution.dart';
import 'package:feria_solidaridad/modules/institutions/model/institution_preview.dart';
import 'package:feria_solidaridad/modules/institutions/model/project_preview.dart';
import 'package:feria_solidaridad/modules/institutions/viewmodel/services/institutions_service.dart';
import 'package:feria_solidaridad/modules/projects/model/project.dart';
import 'package:feria_solidaridad/modules/projects/view/projects_tab.dart';
import 'package:feria_solidaridad/networking/network_service.dart';
import 'package:feria_solidaridad/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class InstitutionDetailPage extends StatelessWidget {
  const InstitutionDetailPage({super.key, required this.currentInstitution});

  final InstitutionPreview currentInstitution;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InstitutionDetailProvider(
        institutionService: InstitutionsService(
            networkService: NetworkService(baseUrl: kApiBaseUrl)),
        institutionPreview: currentInstitution,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(currentInstitution.name),
          backgroundColor: kPrimaryColor,
        ),
        body: Consumer<InstitutionDetailProvider>(builder: (context, state, _) {
          Institution? institution = state.institution;
          if (institution != null) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  institution.images.isNotEmpty
                      ? ImagesHeader(
                          imagesUrls: institution.images
                              .map<String>((e) => e.url)
                              .toList(),
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TitleSection(
                          title: institution.name,
                        ),
                        const SizedBox(
                          height: 32.0,
                        ),
                        InformationBullet(
                          title: "¿Quienes somos?",
                          body: institution.aboutUs,
                        ),
                        const SizedBox(
                          height: 32.0,
                        ),
                        InformationBullet(
                          title: "Objetivo",
                          body: institution.objective,
                        ),
                        const SizedBox(
                          height: 32.0,
                        ),
                        InformationBullet(
                          title: "Mision",
                          body: institution.mission,
                        ),
                        const SizedBox(
                          height: 32.0,
                        ),
                        InformationBullet(
                          title: "Vision",
                          body: institution.vision,
                        ),
                        const SizedBox(
                          height: 32.0,
                        ),
                        institution.videoUrl.isNotEmpty
                            ? VideoSection(videoId: institution.videoUrl)
                            : Container(),
                        const SizedBox(
                          height: 32.0,
                        ),
                        institution.projects.isNotEmpty
                            ? ProjectsSection(
                                projects: institution.projects,
                              )
                            : Container(),
                        const SizedBox(
                          height: 32.0,
                        ),
                        institution.contacts.isNotEmpty
                            ? ContactsSection(contacts: institution.contacts)
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
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

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 8.0,
        ),
      ],
    );
  }
}

class InformationBullet extends StatelessWidget {
  const InformationBullet({super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(body),
      ],
    );
  }
}

// Projects section
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key, required this.projects});
  final List<ProjectPreview> projects;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "PROYECTOS",
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16.0,
        ),
        ...projects.map((currentProject) {
          return ProjectListCard(project: currentProject);
        }),
      ],
    );
  }
}

/// Contacts section
class ContactsSection extends StatelessWidget {
  const ContactsSection({super.key, required this.contacts});

  final List<ContactData> contacts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "CONTACTOS",
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 8.0,
        ),
        ...contacts.map(
          (contact) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                contact.data,
                style: Theme.of(context).textTheme.button,
              ),
            );
          },
        ),
      ],
    );
  }
}

/// Video Section
class VideoSection extends StatefulWidget {
  const VideoSection({super.key, required this.videoId});

  final String videoId;

  @override
  State<VideoSection> createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressColors: const ProgressBarColors(
        playedColor: kPrimaryColor,
        handleColor: kSecondaryColor,
      ),
    );
  }
}

/// Images header
class ImagesHeader extends StatefulWidget {
  const ImagesHeader({super.key, required this.imagesUrls});

  final List<String> imagesUrls;

  @override
  State<ImagesHeader> createState() => _ImagesHeaderState();
}

class _ImagesHeaderState extends State<ImagesHeader> {
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1);
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 200),
      child: Stack(
        children: [
          PageView.builder(
            onPageChanged: (currentPage) {
              setState(() {
                page = currentPage;
              });
            },
            padEnds: false,
            pageSnapping: true,
            controller: _pageController,
            itemBuilder: (context, index) {
              return ImageLoader(imageUrl: widget.imagesUrls[index]);
            },
            itemCount: widget.imagesUrls.length,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.imagesUrls.length; i++) ...[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      i == page ? Icons.circle_rounded : Icons.circle_outlined,
                      color: kPrimaryColor,
                      size: 16.0,
                    ),
                  ),
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}
