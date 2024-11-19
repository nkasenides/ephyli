import 'package:ephyli/model/game_badge.dart';
import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {

  BadgeWidget(this.badge, {super.key, this.size = 75});

  GameBadge badge;
  double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: badge.isOwned ?
          Image.asset(badge.imageCompletedRes) :
          Image.asset(badge.imageIncompleteRes)
      ),
    );
  }


}
