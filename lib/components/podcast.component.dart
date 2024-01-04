import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podcast_player/constants/colors.dart';
import 'package:podcast_player/models/podcast.model.dart';

class PodCastComponent extends StatelessWidget {
  final PodCast podCast;
  const PodCastComponent({super.key, required this.podCast});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 9, bottom: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: Image.asset(
                  podCast.image,
                  height: 70,
                  width: 70,
                ),
                // decoration: BoxDecoration(
                //     image:
                //         const DecorationImage(image: AssetImage(podCast.image)),
                //     borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        podCast.date,
                        style: const TextStyle(
                            color: AppColors.hintColor,
                            fontFamily: 'SF Pro Text'),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        podCast.time,
                        style: const TextStyle(
                            color: Colors.white, fontFamily: 'SF Pro Text'),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 250,
                    child: Text(
                      podCast.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  )
                ],
              ),
            ],
          ),
          SvgPicture.asset('assets/icons/more-vertical.svg')
        ],
      ),
    );
  }
}
