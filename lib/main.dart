import 'package:flutter/material.dart';
import 'package:podcast_player/constants/colors.dart';
import 'package:podcast_player/models/podcast.model.dart';
import 'package:podcast_player/routes/app.route.dart';
import 'package:podcast_player/screens/bottomnavigation.dart';
import 'package:podcast_player/screens/home.screen.dart';
import 'package:podcast_player/screens/postcastplayer.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Podcast Player',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generatorRoute,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
          useMaterial3: true,
        ),
        home: const BottomNavigation());
  }
}
