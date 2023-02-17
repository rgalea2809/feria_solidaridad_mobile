import 'package:feria_solidaridad/constants/app_constants.dart';
import 'package:feria_solidaridad/constants/debug_constants.dart';
import 'package:feria_solidaridad/constants/theme_constants.dart';
import 'package:feria_solidaridad/modules/home/model/social_link_data.dart';
import 'package:feria_solidaridad/widgets/image_gallery_scroller.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: CustomScrollView(
        slivers: [
          HomeAppBar(),
          HomeWelcomeSection(),
          HomeMediaSection(),
          HomeFooter(
            socialLinks: [
              SocialLinkData(
                url: "facebook.com/ucaserviciosocial",
                icon: Icon(Icons.facebook),
                displayName: "Facebook/UcaServicioSocial",
              ),
            ],
          ),
        ],
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
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          "Feria de la Solidaridad",
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Colors.white,
              ),
        ),
        background: Image.asset(
          "assets/images/home_hero.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class HomeWelcomeSection extends StatelessWidget {
  const HomeWelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "XXI Feria de la Solidaridad",
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
            ),
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
                              child: Image.asset("assets/logo/logo-1.png"),
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
            )
          ],
        ),
      ),
    );
  }
}

class HomeMediaSection extends StatelessWidget {
  const HomeMediaSection({super.key});

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
                            HomeYoutubeVideo(),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "\"$kLoremParagraph\"",
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "P. Andreu Oliva",
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
                          const ImageGalleryScroller(
                            imageUrls: ["", "asd", "", "", ""],
                            delay: Duration(),
                          ),
                          const ImageGalleryScroller(
                            imageUrls: ["", "asd", "", "", ""],
                            delay: Duration(milliseconds: 2500),
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
  HomeYoutubeVideo({super.key});

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: kRectorVideoId,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

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
