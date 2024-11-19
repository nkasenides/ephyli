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
    glossaryBadge,

    //Challenge badges:
    challenge1Badge,
    challenge2Badge,
    challenge3Badge,
    challenge4Badge,
    challenge5Badge,
    challenge6Badge,
    challenge7Badge,
    challenge8Badge,
    challenge9Badge,
    challenge10Badge,
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

  static final GameBadge tutorialBadge = GameBadge(
    id: "tutorialBadge",
    nameRes: "tutorial_badge_name",
    descriptionRes: "tutorial_badge_description",
    imageCompletedRes: AppImages.badge_tutorial,
    imageIncompleteRes: AppImages.badge_tutorial_bw,
  );

  static final GameBadge buddyBadge = GameBadge(
    id: "buddyBadge",
    nameRes: "buddy_badge_name",
    descriptionRes: "buddy_badge_description",
    imageCompletedRes: AppImages.badge_buddy,
    imageIncompleteRes: AppImages.badge_buddy_bw,
  );

  static final GameBadge glossaryBadge = GameBadge(
    id: "glossaryBadge",
    nameRes: "glossary_badge_name",
    descriptionRes: "glossary_badge_description",
    imageCompletedRes: AppImages.badge_glossary,
    imageIncompleteRes: AppImages.badge_glossary_bw,
  );

  static final GameBadge challenge1Badge = GameBadge(
    id: "challenge1Badge",
    nameRes: "c1_badge_name",
    descriptionRes: "c1_badge_description",
    imageCompletedRes: AppImages.badge_c1,
    imageIncompleteRes: AppImages.badge_c1_bw,
  );

  static final GameBadge challenge2Badge = GameBadge(
    id: "challenge2Badge",
    nameRes: "c2_badge_name",
    descriptionRes: "c2_badge_description",
    imageCompletedRes: AppImages.badge_c2,
    imageIncompleteRes: AppImages.badge_c2_bw,
  );

  static final GameBadge challenge3Badge = GameBadge(
    id: "challenge3Badge",
    nameRes: "c3_badge_name",
    descriptionRes: "c3_badge_description",
    imageCompletedRes: AppImages.badge_c3,
    imageIncompleteRes: AppImages.badge_c3_bw,
  );

  static final GameBadge challenge4Badge = GameBadge(
    id: "challenge4Badge",
    nameRes: "c4_badge_name",
    descriptionRes: "c4_badge_description",
    imageCompletedRes: AppImages.badge_c4,
    imageIncompleteRes: AppImages.badge_c4_bw,
  );

  static final GameBadge challenge5Badge = GameBadge(
    id: "challenge5Badge",
    nameRes: "c5_badge_name",
    descriptionRes: "c5_badge_description",
    imageCompletedRes: AppImages.badge_c5,
    imageIncompleteRes: AppImages.badge_c5_bw,
  );

  static final GameBadge challenge6Badge = GameBadge(
    id: "challenge6Badge",
    nameRes: "c6_badge_name",
    descriptionRes: "c6_badge_description",
    imageCompletedRes: AppImages.badge_c6,
    imageIncompleteRes: AppImages.badge_c6_bw,
  );

  static final GameBadge challenge7Badge = GameBadge(
    id: "challenge7Badge",
    nameRes: "c7_badge_name",
    descriptionRes: "c7_badge_description",
    imageCompletedRes: AppImages.badge_c7,
    imageIncompleteRes: AppImages.badge_c7_bw,
  );

  static final GameBadge challenge8Badge = GameBadge(
    id: "challenge8Badge",
    nameRes: "c8_badge_name",
    descriptionRes: "c8_badge_description",
    imageCompletedRes: AppImages.badge_c8,
    imageIncompleteRes: AppImages.badge_c8_bw,
  );

  static final GameBadge challenge9Badge = GameBadge(
    id: "challenge9Badge",
    nameRes: "c9_badge_name",
    descriptionRes: "c9_badge_description",
    imageCompletedRes: AppImages.badge_c9,
    imageIncompleteRes: AppImages.badge_c9_bw,
  );

  static final GameBadge challenge10Badge = GameBadge(
    id: "challenge10Badge",
    nameRes: "c10_badge_name",
    descriptionRes: "c10_badge_description",
    imageCompletedRes: AppImages.badge_c10,
    imageIncompleteRes: AppImages.badge_c10_bw,
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