import 'package:flutter/material.dart';

import '../theme_data/themes.dart';
class AppBarChips extends StatelessWidget {
  const AppBarChips({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.5),
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(22))),
        child: TextButton(
            onPressed: () {},
            child: Text(
              text,
              style: const TextStyle(
                  color: MyTheme.backgroundColorHome, fontSize: 20),
            )));
  }
}
