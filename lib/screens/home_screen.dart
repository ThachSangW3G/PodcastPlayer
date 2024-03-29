import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podcast_player/components/category_component.dart';
import 'package:podcast_player/components/podcast_component.dart';
import 'package:podcast_player/constants/colors.dart';
import 'package:podcast_player/models/category_model.dart';
import 'package:podcast_player/models/podcast_model.dart';
import 'package:podcast_player/routes/app_route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var showCategories = true;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Looking for podcast channels",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: 22),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 50,
                child: TextField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  textAlignVertical: TextAlignVertical.bottom,
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
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
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
                      InkWell(
                        onTap: () {
                          setState(() {
                            showCategories = !showCategories;
                          });
                        },
                        child: showCategories
                            ? SvgPicture.asset(
                                'assets/icons/chevron-down.svg',
                                height: 30,
                                width: 30,
                              )
                            : const Icon(
                                Icons.chevron_right_outlined,
                                color: Colors.white,
                              ),
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
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: showCategories,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 120,
                  child: ListView.builder(
                    itemCount: listCategory.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) =>
                        CategoryComponent(category: listCategory[index]),
                  ),
                ),
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
              height: 5,
            ),
            //PodCastComponent(podCast: listPodCast[2]),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (_, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
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
      )),
    );
  }
}
