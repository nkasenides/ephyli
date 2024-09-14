import 'package:ephyli/model/game_badge.dart';
import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {

  BadgeWidget(this.badge, {super.key});

  GameBadge badge;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: badge.isOwned ?
          Image.asset(badge.imageCompletedRes) :
          Image.asset(badge.imageIncompleteRes)
      ),
    );
  }


}
