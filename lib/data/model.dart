import 'package:flutter/material.dart';

class Content {
  final String name;
  final String image;
  final String? description;
  final Color? color;

  const Content({
    required this.name,
    required this.image,
    this.description,
    this.color,
  });
}
