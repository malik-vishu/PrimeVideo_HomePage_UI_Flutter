// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:primevideo_ui/data/AllLists.dart';
import 'package:primevideo_ui/theme_data/themes.dart';
import 'package:video_player/video_player.dart';

class TopContentWidget extends StatelessWidget {
  const TopContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 250.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(topContent.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 250.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ],
    );
  }
}

class TopContentWidgetM extends StatelessWidget {
  const TopContentWidgetM({super.key});

  @override
  Widget build(BuildContext context) {
    return BannerCarousel(
      margin: EdgeInsets.zero,
      banners: listBanners,
      height: 250,
      activeColor: Colors.white,
      disableColor: const Color.fromARGB(245, 42, 44, 50),
      animation: false,
      borderRadius: 0,
      width: MediaQuery.of(context).size.width,
    );
  }
}

class TopContentWidgetD extends StatelessWidget {
  const TopContentWidgetD({super.key});

  @override
  Widget build(BuildContext context) {
    return BannerCarousel(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      customizedBanners: [
        for (int i = 0; i < 4; i++)
          TopContentItemD(
              imagePath: listBanners[i].imagePath, video: listBannerVideo[i]),
      ],
      height: 440,
      activeColor: Colors.white,
      disableColor: const Color.fromARGB(245, 42, 44, 50),
      animation: false,
      borderRadius: 12,
      width: MediaQuery.of(context).size.width,
      indicatorBottom: false,
    );
  }
}

class TopContentItemD extends StatefulWidget {
  const TopContentItemD({
    Key? key,
    required this.imagePath,
    required this.video,
  }) : super(key: key);
  final String imagePath;
  final String video;

  @override
  State<TopContentItemD> createState() => _TopContentItemDState();
}

class _TopContentItemDState extends State<TopContentItemD> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    if (widget.video != "null") {
      _videoController = VideoPlayerController.asset(widget.video)
        ..initialize().then((_) => setState(() {}))
        ..setLooping(true)
        ..setVolume(0)
        ..play();
    }
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      widget.video!="null" && _videoController.value.isInitialized 
          ? Align(
              alignment: Alignment.center,
              child: VideoPlayer(_videoController),
            )
          : Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.imagePath), fit: BoxFit.cover)),
            ),
      const Positioned(
        bottom: 120,
        left: 30,
        child: Row(
          children: [
            Icon(
              Icons.check_circle_rounded,
              color: MyTheme.blueColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Included with Prime",
              style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      Positioned(
          bottom: 16,
          left: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  iconSize: 100,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_circle_filled,
                    color: Colors.white,
                  )),
              const SizedBox(
                width: 10,
              ),
              Text("Play",
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w700)),
              const SizedBox(
                width: 24,
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.grey[700]!.withOpacity(0.8),
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
                child: const Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.grey[700]!.withOpacity(0.8),
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
                child: const Icon(
                  Icons.info_outline_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              )
            ],
          ))
    ]);
  }
}
