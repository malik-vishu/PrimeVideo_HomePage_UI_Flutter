import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../exports/widgets_export.dart';
import '../theme_data/themes.dart';

class AppBarWidgetM extends StatelessWidget {
  const AppBarWidgetM({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        color: MyTheme.backgroundColorHome,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/Logo_mobile.png",
                    width: 100,
                  ),
                  const Spacer(),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.cast,
                              color: Colors.white,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.person_crop_circle,
                              color: Colors.blue[100],
                              size: 32,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppBarChips(
                      text: "All",
                    ),
                    AppBarChips(
                      text: "Movies",
                    ),
                    AppBarChips(
                      text: "TV Shows",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class AppBarWidgetD extends StatelessWidget {
  const AppBarWidgetD({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      color: MyTheme.backgroundColorHome,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/Logo_desk.png",
              width: 100,
            ),
            const SizedBox(
              width: 20,
            ),
            const AppBarButtonsDesk(
              text: "Home",
            ),
            const AppBarButtonsDesk(
              text: "Store",
            ),
            const AppBarButtonsDesk(text: "Live TV", arrow: false),
            const AppBarButtonsDesk(
              text: "Categories",
            ),
            const AppBarButtonsDesk(
              text: "My Stuff",
            ),
            const SizedBox(
              width: 30,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_rounded,
                  size: 32,
                  color: Colors.grey,
                )),
            const SizedBox(
              width: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Vishu",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                const SizedBox(
                  width: 8,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.person_crop_circle,
                      size: 32,
                      color: Colors.blue[100],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarButtonsDesk extends StatelessWidget {
  const AppBarButtonsDesk({
    Key? key,
    required this.text,
    this.arrow,
  }) : super(key: key);
  final String text;
  final bool? arrow;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
          style: textButtonStyle,
          onPressed: () {
            log("$text");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              arrow != false
                  ? const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.white,
                      size: 30,
                    )
                  : Container()
            ],
          )),
    );
  }
}

final ButtonStyle textButtonStyle = ButtonStyle(
  overlayColor:
      MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
    if (states.contains(MaterialState.focused)) {
      return const Color.fromARGB(255, 134, 165, 219);
    }
    if (states.contains(MaterialState.hovered)) {
      return Color.fromARGB(255, 10, 54, 90).withOpacity(0.4);
    }

    return null;
  }),
);
