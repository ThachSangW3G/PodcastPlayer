import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podcast_player/components/category.component.dart';
import 'package:podcast_player/components/podcast.component.dart';
import 'package:podcast_player/constants/colors.dart';
import 'package:podcast_player/models/category.model.dart';
import 'package:podcast_player/models/podcast.model.dart';
import 'package:podcast_player/routes/app.route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: const Text(
          'Welcome John Doe',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'SF Pro Display',
              fontSize: 25,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2),
        ),
        backgroundColor: AppColors.primary,
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                'assets/icons/bell.svg',
                width: 30,
                height: 30,
              ))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Looking for podcast channels",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8)),
                    prefixIcon: SvgPicture.asset(
                      'assets/icons/search.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                      color: AppColors.hintColor,
                      fontFamily: 'SF Pro Display',
                    ),
                    filled: true,
                    fillColor: AppColors.seconary,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Categoties',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SF Pro Display',
                            fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        'assets/icons/chevron-down.svg',
                        height: 30,
                        width: 30,
                      )
                    ],
                  ),
                  const Text(
                    'View all',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'SF Pro Text'),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  itemCount: listCategory.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) =>
                      CategoryComponent(category: listCategory[index]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
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
              const SizedBox(
                height: 5,
              ),
              //PodCastComponent(podCast: listPodCast[2]),
              SizedBox(
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
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
