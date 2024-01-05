import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:podcast_player/models/podcast_model.dart';
import 'package:podcast_player/screens/home_screen.dart';
import 'package:podcast_player/screens/postcastplayer_screen.dart';

class RouteGenerator {
  const RouteGenerator._();
  static Route<dynamic> generatorRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case home:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: HomeScreen())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );

      case podcast_player:
        int indexPodcast = args as int;
        return PageTransition(
          child: SafeArea(
              child: SafeArea(
                  child: PodcastPlayerScreen(
            indexPodcast: indexPodcast,
          ))),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );

      case play:
        int indexPodcast = args as int;
        return PageTransition(
          child: SafeArea(
              child: SafeArea(
                  child: PodcastPlayerScreen(
            indexPodcast: indexPodcast,
          ))),
          type: PageTransitionType.theme,
          duration: const Duration(milliseconds: 400),
        );
      default:
        throw const RouteException("Route not found");
    }
  }

  static const podcast_player = '/podcast_player';
  static const play = '/play';

  static const home = '/home';
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
