import 'package:ephyli/model/game_badge.dart';
import 'package:ephyli/model/challenge.dart';
import 'package:flutter/material.dart';

class ChallengeImage extends StatelessWidget {

  Challenge challenge;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: challenge.completed ? challenge.completedImage : challenge.incompleteImage
      ),
    );
  }

  ChallengeImage(this.challenge, {super.key});
}
