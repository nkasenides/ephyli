import 'package:flutter/material.dart';

class Challenge {

  Widget completedImage;
  Widget incompleteImage;
  String name;
  String description;
  bool completed = false;

  Challenge({
    required this.completedImage,
    required this.incompleteImage,
    required this.name,
    required this.description
  });

}