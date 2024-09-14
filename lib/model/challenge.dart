import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/app_images.dart';
import '../utils/pref_utils.dart';

class Challenge {

  String id;
  String imageCompletedRes;
  String imageIncompleteRes;
  String nameRes;
  String descriptionRes;
  List<String> activityIDs;
  bool completed = false;
  List<String> badgeIDs;

  Challenge({
    required this.id,
    required this.imageCompletedRes,
    required this.imageIncompleteRes,
    required this.nameRes,
    required this.descriptionRes,
    required this.activityIDs,
    required this.badgeIDs
  });

  static final List<Challenge> challenges = [
    challenge1,
    challenge2,
  ];

  static final Challenge challenge1 = Challenge(
    id: "challenge1",
    nameRes: "Challenge 1",
    descriptionRes: "challenge1Description",
    imageCompletedRes: AppImages.logo,
    imageIncompleteRes: AppImages.logoBlackAndWhite,
    activityIDs: [
      "c1a1",
      "c1a2"
    ],
    badgeIDs: [
      "challenge1Badge"
    ]
  );

  static final Challenge challenge2 = Challenge(
      id: "challenge2",
      nameRes: "Challenge 2",
      descriptionRes: "challenge2Description",
      imageCompletedRes: AppImages.logo,
      imageIncompleteRes: AppImages.logoBlackAndWhite,
      activityIDs: [
      ],
      badgeIDs: [
      ]
  );

  //Completes an activity of a challenge.
  void completeActivity(String activityID) {
    debugPrint("completeActivity");
    //Save completion to prefs:
    SharedPreferences.getInstance().then((prefs) {
      List<String> activityCompletionList = prefs.getStringList(
          PrefUtils.activity_completion_key) ?? [];
      activityCompletionList.add(activityID);
      prefs.setStringList(
          PrefUtils.activity_completion_key, activityCompletionList);
    });
  }

  //Resets an activity's completion:
  void resetActivity(String activityID) {
    debugPrint("resetActivity");
    SharedPreferences.getInstance().then((prefs) {
      List<String> activityCompletionList = prefs.getStringList(
          PrefUtils.activity_completion_key) ?? [];
      activityCompletionList.remove(activityID);
      prefs.setStringList(
          PrefUtils.activity_completion_key, activityCompletionList);
    });
  }

  //Checks if a specific activity is completed:
  Future<bool> isActivityCompleted(String activityID) async {
    var prefs = await SharedPreferences.getInstance();
    List<String> activityCompletionList =
        prefs.getStringList(PrefUtils.activity_completion_key) ?? [];
    return activityCompletionList.contains(activityID);
  }

  //Gets the completion of the challenge's activities as a %
  Future<double> getProgress() async {
    var prefs = await SharedPreferences.getInstance();
    List<String> activityCompletionList =
        prefs.getStringList(PrefUtils.activity_completion_key) ?? [];

    //Count completed activities
    int totalActivities = activityIDs.length;
    int completedActivities = 0;

    for (var activityID in activityIDs) {
      bool activityCompleted = await isActivityCompleted(activityID);
      if (activityCompleted) {
        completedActivities++;
      }
    }

    //Translate into %:
    return completedActivities / totalActivities;
  }

}