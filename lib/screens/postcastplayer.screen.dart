import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podcast_player/components/podcast.component.dart';
import 'package:podcast_player/constants/colors.dart';
import 'package:podcast_player/models/podcast.model.dart';
import 'package:podcast_player/routes/app.route.dart';

class PodcastPlayerScreen extends StatefulWidget {
  final PodCast podCast;
  const PodcastPlayerScreen({super.key, required this.podCast});

  @override
  State<PodcastPlayerScreen> createState() => _PodcastPlayerScreenState();
}

class _PodcastPlayerScreenState extends State<PodcastPlayerScreen> {
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
                  image:
                      DecorationImage(image: AssetImage(widget.podCast.image))),
              child: Container(
                margin: const EdgeInsets.only(top: 10, right: 10),
                child: Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(
                    'assets/icons/heart.svg',
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.podCast.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'SF Pro Display',
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
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
                  SvgPicture.asset(
                    'assets/icons/skip-back.svg',
                    height: 40,
                    width: 40,
                  ),
                  SvgPicture.asset(
                    'assets/icons/play-circle.svg',
                    height: 60,
                    width: 60,
                  ),
                  SvgPicture.asset(
                    'assets/icons/skip-forward.svg',
                    height: 40,
                    width: 40,
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
              value: 60,
              onChanged: (onChanged) {},
              min: 0,
              max: 100,
              activeColor: AppColors.activeColor,
              inactiveColor: AppColors.inActiveColor,
              thumbColor: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '02:36',
                    style: TextStyle(
                        color: AppColors.hintColor, fontFamily: 'SF Pro Text'),
                  ),
                  Text(
                    '03:06',
                    style: TextStyle(
                        color: AppColors.hintColor, fontFamily: 'SF Pro Text'),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: SizedBox(
                  height: 310,
                  child: ListView.builder(
                    itemBuilder: (_, index) => InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              RouteGenerator.podcast_player,
                              arguments: listPodCast[index]);
                        },
                        child: PodCastComponent(podCast: listPodCast[index])),
                    scrollDirection: Axis.vertical,
                    itemCount: listPodCast.length,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
