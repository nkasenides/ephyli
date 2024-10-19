import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/app_images.dart';
import '../utils/ui_utils.dart';

class GameBadge {

  final String id;
  final String nameRes;
  final String descriptionRes;
  final String imageCompletedRes;
  final String imageIncompleteRes;
  bool isOwned = false;

  GameBadge({
    required this.id,
    required this.nameRes,
    required this.descriptionRes,
    required this.imageCompletedRes,
    required this.imageIncompleteRes,
  });

  static final List<GameBadge> gameBadges = [

    //Introductory badges:
    tutorialBadge,
    buddyBadge,

    //Challenge badges:
    challenge1Badge,
    challenge2Badge,
    challenge3Badge,
    challenge4Badge,
  ];

  //Finds and returns a badge:
  static GameBadge? findBadge(String badgeID) {
    for (var badge in gameBadges) {
      if (badge.id == badgeID) {
        return badge;
      }
    }
    return null;
  }

  /// ---- BADGES ----*
  /*-----------------------------------------------------------*/

  //TODO - Customize the images of each of the badges.

  static final GameBadge tutorialBadge = GameBadge(
    id: "tutorialBadge",
    nameRes: "tutorial_badge_name",
    descriptionRes: "tutorial_badge_description",
    imageCompletedRes: AppImages.logo,
    imageIncompleteRes: AppImages.logoBlackAndWhite,
  );

  static final GameBadge buddyBadge = GameBadge(
    id: "buddyBadge",
    nameRes: "buddy_badge_name",
    descriptionRes: "buddy_badge_description",
    imageCompletedRes: AppImages.logo,
    imageIncompleteRes: AppImages.logoBlackAndWhite,
  );

  static final GameBadge challenge1Badge = GameBadge(
    id: "challenge1Badge",
    nameRes: "c1_badge_name",
    descriptionRes: "c1_badge_description",
    imageCompletedRes: AppImages.logo,
    imageIncompleteRes: AppImages.logoBlackAndWhite,
  );

  static final GameBadge challenge2Badge = GameBadge(
    id: "challenge2Badge",
    nameRes: "c2_badge_name",
    descriptionRes: "c2_badge_description",
    imageCompletedRes: AppImages.logo,
    imageIncompleteRes: AppImages.logoBlackAndWhite,
  );

  static final GameBadge challenge3Badge = GameBadge(
    id: "challenge3Badge",
    nameRes: "c3_badge_name",
    descriptionRes: "c3_badge_description",
    imageCompletedRes: AppImages.logo,
    imageIncompleteRes: AppImages.logoBlackAndWhite,
  );

  static final GameBadge challenge4Badge = GameBadge(
    id: "challenge4Badge",
    nameRes: "c4_badge_name",
    descriptionRes: "c4_badge_description",
    imageCompletedRes: AppImages.logo,
    imageIncompleteRes: AppImages.logoBlackAndWhite,
  );

  /*-----------------------------------------------------------*/

  //Earns the player the badge by saving it into prefs and showing a dialog.
  earn(BuildContext context) {
    //Save badge earned to prefs:
    SharedPreferences.getInstance().then((prefs) {
      bool owned = prefs.getBool("badge_$id") ?? false;
      if (!owned) {
        isOwned = true;
        prefs.setBool("badge_$id", true).then((value) {
          //Show UI dialog to congratulate player:
          showDialog(context: context, builder: (context) {
            //Show dialog for badge:
            return UIUtils.createBadgeDialog(this, context);
          },);
        },);
      }
    },);
  }

  //Checks if a badge is earned.
  Future<bool> isEarned() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool("badge_$id") ?? false;
  }


}