import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podcast_player/components/podcast_component.dart';
import 'package:podcast_player/constants/colors.dart';
import 'package:podcast_player/models/podcast_model.dart';
import 'package:podcast_player/routes/app_route.dart';

class PodcastPlayerScreen extends StatefulWidget {
  final int indexPodcast;
  const PodcastPlayerScreen({super.key, required this.indexPodcast});

  @override
  State<PodcastPlayerScreen> createState() => _PodcastPlayerScreenState();
}

class _PodcastPlayerScreenState extends State<PodcastPlayerScreen> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  @override
  void initState() {
    super.initState();

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    player.play(AssetSource(listPodCast[widget.indexPodcast].audio));
    player.setVolume(10.0);
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.primary,
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.settings,
                color: Colors.white,
              )),
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage(listPodCast[widget.indexPodcast].image))),
              child: Container(
                margin: const EdgeInsets.only(top: 10, right: 10),
                child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        listPodCast[widget.indexPodcast].like =
                            !listPodCast[widget.indexPodcast].like;
                        print(listPodCast[widget.indexPodcast].like);
                        setState(() {});
                      },
                      icon: listPodCast[widget.indexPodcast].like
                          ? const Icon(
                              Icons.favorite,
                              color: AppColors.activeColor,
                              size: 40,
                            )
                          : SvgPicture.asset(
                              'assets/icons/heart.svg',
                              height: 40,
                              width: 40,
                            ),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                listPodCast[widget.indexPodcast].title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(
                    'assets/icons/shuffle.svg',
                    height: 30,
                    width: 30,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                          RouteGenerator.play,
                          arguments: widget.indexPodcast > 0
                              ? widget.indexPodcast - 1
                              : listPodCast.length - 1);
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/skip-back.svg',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (isPlaying) {
                        player.pause();
                      } else {
                        player.resume();
                      }
                    },
                    icon: isPlaying
                        ? const Icon(
                            Icons.pause_circle,
                            size: 60,
                            color: Colors.white,
                          )
                        : SvgPicture.asset(
                            'assets/icons/play-circle.svg',
                            height: 60,
                            width: 60,
                          ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                          RouteGenerator.play,
                          arguments:
                              widget.indexPodcast < listPodCast.length - 1
                                  ? widget.indexPodcast + 1
                                  : 0);
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/skip-forward.svg',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/sync.svg',
                    height: 30,
                    width: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) {
                final position = Duration(seconds: value.toInt());
                player.seek(position);
                player.resume();
              },
              activeColor: AppColors.activeColor,
              inactiveColor: AppColors.inActiveColor,
              thumbColor: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatTime(position.inSeconds),
                    style: const TextStyle(
                        color: AppColors.hintColor, fontFamily: 'SF Pro Text'),
                  ),
                  Text(
                    formatTime((duration - position).inSeconds),
                    style: const TextStyle(
                        color: AppColors.hintColor, fontFamily: 'SF Pro Text'),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Podcast Episodes',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF Pro Display',
                        fontSize: 20),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'SF Pro Text'),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //PodCastComponent(podCast: listPodCast[2]),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (_, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(
                        RouteGenerator.podcast_player,
                        arguments: index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: PodCastComponent(podCast: listPodCast[index]),
                  )),
              scrollDirection: Axis.vertical,
              itemCount: listPodCast.length,
            )
          ],
        ),
      ),
    );
  }
}
