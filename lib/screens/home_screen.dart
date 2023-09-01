import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:primevideo_ui/data/AllLists.dart';
import 'package:primevideo_ui/data/model.dart';
import 'package:primevideo_ui/theme_data/themes.dart';

import '../exports/widgets_export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MyTheme.backgroundColorHome,
        appBar: PreferredSize(
          preferredSize: screenSize.width < 1200
              ? Size(screenSize.width, 140)
              : const Size(250, 60),
          child: const Responsive(
            mobile: AppBarWidgetM(),
            desktop: AppBarWidgetD(),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Responsive(
                mobile: TopContentWidgetM(key: PageStorageKey('top')),
                desktop: TopContentWidgetD(key: PageStorageKey('top')),
              ),
            ),
            SliverToBoxAdapter(
                child: Responsive(
              mobile: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ScrollableItemListM(
                  // key: const PageStorageKey('continue'),
                  list: continueWatching,
                  text: "Continue Watching",
                  height: 120,
                  width: 250,
                ),
              ),
              desktop: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ScrollableItemListD(
                  // key: const PageStorageKey('continue'),
                  list: continueWatching,
                  text: "Continue Watching",
                  height: 130,
                  width: 250,
                  heightOld: 130,
                ),
              ),
            )),
            SliverToBoxAdapter(
                child: Responsive(
              mobile: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ScrollableItemListM(
                  // key: const PageStorageKey('original'),
                  list: original,
                  text: "Amazon Original Series",
                  height: 240,
                  width: 170,
                  playButton: false,
                ),
              ),
              desktop: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ScrollableItemListD(
                  // key: const PageStorageKey('original'),
                  list: original,
                  text: "Amazon Original Series",
                  height: 390,
                  width: 240,
                  playButton: false,
                  heightOld: 390,
                  prime: true,
                ),
              ),
            )),
            SliverToBoxAdapter(
                child: Responsive(
              mobile: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: ScrollableItemListM(
                  // key: const PageStorageKey('academy'),
                  list: academy,
                  text: "ACADEMY AWARD nominees and winners",
                  height: 120,
                  width: 250,
                ),
              ),
              desktop: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ScrollableItemListD(
                  // key: const PageStorageKey('academy'),
                  list: academy,
                  text: "ACADEMY AWARD nominees and winners",
                  height: 130,
                  width: 250,
                  heightOld: 130,
                  prime: true,
                ),
              ),
            ))
          ],
        ));
  }
}

class ScrollableItemListM extends StatelessWidget {
  const ScrollableItemListM({
    Key? key,
    required this.list,
    required this.text,
    required this.height,
    required this.width,
    this.playButton,
  }) : super(key: key);

  final List<Content> list;
  final String text;
  final double height;
  final double width;
  final bool? playButton;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: const TextStyle(
                color: MyTheme.whiteColor,
                fontSize: 21,
                fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: height,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                final item = list[index];
                return InkWell(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(
                              image: AssetImage(
                                item.image,
                              ),
                              fit: BoxFit.cover,
                            )),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: width,
                        height: height,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: height,
                        width: width,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black87,
                              Colors.black45,
                              Colors.transparent,
                            ],
                            stops: [0, 0.25, 1],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                      playButton == null
                          ? Positioned(
                              bottom: 8,
                              left: 4,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.play_circle_filled_rounded,
                                  color: Color.fromARGB(240, 255, 255, 255),
                                  size: 42,
                                ),
                              ))
                          : Container(),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class ScrollableItemListD extends StatefulWidget {
  ScrollableItemListD(
      {Key? key,
      required this.list,
      required this.text,
      required this.height,
      required this.width,
      required this.heightOld,
      this.playButton,
      this.prime})
      : super(key: key);

  final List<Content> list;
  final String text;
  double height;
  final double width;
  final bool? playButton;
  bool? description = false;
  final bool? prime;

  double heightOld;

  @override
  State<ScrollableItemListD> createState() => _ScrollableItemListDState();
}

class _ScrollableItemListDState extends State<ScrollableItemListD> {
  int hoveredIndex = -1;
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          //richtext
          child: widget.prime == true
              ? RichText(
                  text: TextSpan(
                      text: "Prime   ",
                      style: const TextStyle(
                          color: MyTheme.blueColor,
                          fontSize: 21,
                          fontWeight: FontWeight.w700),
                      children: [
                      TextSpan(
                        text: widget.text,
                        style: const TextStyle(
                            color: MyTheme.whiteColor,
                            fontSize: 21,
                            fontWeight: FontWeight.w700),
                      )
                    ]))
              : Text(
                  widget.text,
                  style: const TextStyle(
                      color: MyTheme.whiteColor,
                      fontSize: 21,
                      fontWeight: FontWeight.w700),
                ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: widget.height,
          child: ListView.builder(
              //add code to hover only single item and double its height only
              scrollDirection: Axis.horizontal,
              itemCount: widget.list.length,
              itemBuilder: (context, index) {
                final item = widget.list[index];
                return InkWell(
                  // onHover: (val) {
                  //   log("$index");
                  //   setState(() {
                  //     isHover = val;
                  //   });
                  // },
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          log("$index");
                        },
                        onHover: (val) {
                          log("$index");
                          setState(() {
                            isHover = val;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.only(
                              top: (isHover) ? 25 : 30.0,
                              bottom: !(isHover) ? 25 : 30),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              image: DecorationImage(
                                image: AssetImage(
                                  item.image,
                                ),
                                fit: BoxFit.cover,
                              )),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: widget.width,
                          height: widget.height,
                        ),
                      ),
                      AnimatedContainer(
                        padding: EdgeInsets.only(
                            top: (isHover) ? 25 : 30.0,
                            bottom: !(isHover) ? 25 : 30),
                        duration: Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: widget.height,
                        width: widget.width,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black87,
                              Colors.black45,
                              Colors.transparent,
                            ],
                            stops: [0, 0.25, 1],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                      widget.playButton == null
                          ? Positioned(
                              bottom: 8,
                              left: 4,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.play_circle_filled_rounded,
                                  color: Color.fromARGB(240, 255, 255, 255),
                                  size: 42,
                                ),
                              ))
                          : Container(),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
