import 'package:feria_solidaridad/constants/app_constants.dart';
import 'package:feria_solidaridad/constants/assets_constants.dart';
import 'package:feria_solidaridad/constants/debug_constants.dart';
import 'package:feria_solidaridad/constants/theme_constants.dart';
import 'package:feria_solidaridad/modules/home/model/home_data_response.dart';
import 'package:feria_solidaridad/modules/home/model/images_response.dart';
import 'package:feria_solidaridad/modules/home/model/social_link_data.dart';
import 'package:feria_solidaridad/modules/home/viewmodel/home_provider.dart';
import 'package:feria_solidaridad/modules/home/viewmodel/services/home_service.dart';
import 'package:feria_solidaridad/modules/home/viewmodel/services/images_service.dart';
import 'package:feria_solidaridad/networking/network_service.dart';
import 'package:feria_solidaridad/widgets/image_gallery_scroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(
        homeService: HomeService(
          networkService: NetworkService(
            baseUrl: kApiBaseUrl,
          ),
        ),
        imagesService: ImagesService(
          networkService: NetworkService(
            baseUrl: kApiBaseUrl,
          ),
        ),
      )..fetchHomeData(),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Consumer<HomeProvider>(builder: (context, state, _) {
          HomeDataResponseData? homeData = state.homeData;
          List<ImagesData> imagesData = state.images;

          if (homeData != null) {
            return CustomScrollView(
              slivers: [
                const HomeAppBar(),
                HomeWelcomeSection(
                  homeData: homeData,
                ),
                HomeMediaSection(
                  homeData: homeData,
                  imagesData: imagesData,
                ),
                HomeFooter(
                  socialLinks: [
                    SocialLinkData(
                      url: kFacebookPageUrl,
                      icon: const Icon(Icons.facebook),
                      displayName: "Facebook/UcaServicioSocial",
                    ),
                    SocialLinkData(
                      url: kContactEmail,
                      icon: const Icon(Icons.email),
                      displayName: "css@uca.edu.sv",
                    ),
                  ],
                ),
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                ),
                child: Text(
                  'Bienvenido',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kPrimaryColor,
      centerTitle: true,
      pinned: true,
      floating: true,
      expandedHeight: 160.0,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(Icons.menu),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          "Feria de la Solidaridad",
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Colors.white,
              ),
        ),
        background: Image.asset(
          kHomeHeroPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class HomeWelcomeSection extends StatelessWidget {
  const HomeWelcomeSection({
    super.key,
    required this.homeData,
  });

  final HomeDataResponseData homeData;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${homeData.yearEdition} Feria de la Solidaridad",
              style: Theme.of(context).textTheme.overline?.copyWith(
                    color: Colors.white,
                  ),
            ),
            Text(
              "¡Bienvenido!",
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: kSecondaryColor,
                  ),
            ),
            const SizedBox(
              height: 16.0,
            ), /*
            Container(
              constraints: const BoxConstraints(maxHeight: 400),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: kAccentColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      // TODO: Change this String to actual paragraph
                      child: const Text(
                        kLoremParagraph,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: kSecondaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Image.asset(
                                kLogoPath,
                                fit: BoxFit.fill,
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )*/
          ],
        ),
      ),
    );
  }
}

class HomeMediaSection extends StatelessWidget {
  const HomeMediaSection({
    super.key,
    required this.homeData,
    required this.imagesData,
  });

  final HomeDataResponseData homeData;
  final List<ImagesData> imagesData;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Container(
            color: kPrimaryColor,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 32.0, horizontal: 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Un mensaje del Rector",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    color: kAccentColor,
                                  ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            HomeYoutubeVideo(
                              videoId: homeData.videoId,
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "\"${homeData.message}\"",
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              homeData.messageAuthor,
                              style: Theme.of(context).textTheme.overline,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Galería de imágenes",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    color: kAccentColor,
                                  ),
                            ),
                          ),
                          ImageGalleryScroller(
                            imagesData: imagesData,
                            delay: const Duration(milliseconds: 2500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HomeYoutubeVideo extends StatelessWidget {
  HomeYoutubeVideo({super.key, required this.videoId});

  final String videoId;

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      ),
      showVideoProgressIndicator: true,
      progressColors: const ProgressBarColors(
        playedColor: kPrimaryColor,
        handleColor: kSecondaryColor,
      ),
    );
  }
}

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key, required this.socialLinks});

  final List<SocialLinkData> socialLinks;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "¿Busca más información?",
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: kSecondaryColor,
                            ),
                      ),
                      Text(
                        "Contáctenos",
                        style: Theme.of(context).textTheme.overline?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  ...socialLinks.map<Widget>(
                    (e) {
                      return GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            e.icon,
                            const SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              e.displayName ?? e.url,
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
