import 'package:ephyli/model/game_badge.dart';
import 'package:ephyli/model/challenge.dart';
import 'package:flutter/material.dart';

class ChallengeImage extends StatelessWidget {

  Challenge challenge;
  double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: challenge.completed ?
          Image.asset(challenge.imageCompletedRes) :
          Image.asset(challenge.imageIncompleteRes)
      ),
    );
  }

  ChallengeImage(this.challenge, {super.key, this.size = 75});
}
