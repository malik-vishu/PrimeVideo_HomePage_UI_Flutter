import 'package:flutter/material.dart';
import 'package:primevideo_ui/widgets/responsive.dart';

import 'exports/screen_export.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prime Video UI',
      theme: ThemeData(),
      home: const Responsive(
        mobile: Navigation(),
        desktop: HomeScreen(),
      ),
    );
  }
}
