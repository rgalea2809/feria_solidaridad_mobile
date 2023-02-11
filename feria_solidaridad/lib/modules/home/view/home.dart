import 'package:feria_solidaridad/constants/app_constants.dart';
import 'package:feria_solidaridad/constants/debug_constants.dart';
import 'package:feria_solidaridad/constants/theme_constants.dart';
import 'package:feria_solidaridad/utils/dummy_data.dart';
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
          const HomeAppBar(),
          const HomeWelcomeSection(),
          SliverToBoxAdapter(
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 32.0, horizontal: 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
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
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 32.0,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  constraints:
                                      const BoxConstraints(maxHeight: 150),
                                  child: PageView.builder(
                                    padEnds: false,
                                    pageSnapping: false,
                                    controller: PageController(
                                      viewportFraction: 0.33,
                                    ),
                                    itemBuilder: (context, index) {
                                      return AspectRatio(
                                        aspectRatio: 1,
                                        child: Container(
                                          color: index % 2 == 0
                                              ? Colors.red
                                              : Colors.blue,
                                          margin: const EdgeInsets.all(8.0),
                                          child: Text(index.toString()),
                                        ),
                                      );
                                    },
                                    itemCount: 5,
                                  ),
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
