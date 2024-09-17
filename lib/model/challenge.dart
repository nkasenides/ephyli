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
  bool unlocked;
  List<String> badgeIDs;
  List<String> unlocksChallengesIDs;

  Challenge({
    required this.id,
    required this.imageCompletedRes,
    required this.imageIncompleteRes,
    required this.nameRes,
    required this.descriptionRes,
    required this.activityIDs,
    required this.badgeIDs,
    required this.unlocksChallengesIDs,
    this.unlocked = false,
  });

  static final List<Challenge> challenges = [
    challenge1,
    challenge2,
  ];

  // * --------------- CHALLENGES

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
    ],
    unlocksChallengesIDs: [
      "challenge2",
    ],
    unlocked: true
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

      ],
      unlocksChallengesIDs: [

      ]
  );

  static Challenge? findChallenge(String challengeID) {
    for (Challenge c in challenges) {
      if (c.id == challengeID) {
        return c;
      }
    }
    return null;
  }

  /*---------------------------------------------------------------------------*/

  //Completes an activity of a challenge.
  void completeActivity(String activityID) {
    debugPrint("completeActivity");
    //Save completion to prefs:
    SharedPreferences.getInstance().then((prefs) {
      List<String> activityCompletionList = prefs.getStringList(
          PrefUtils.activity_completion) ?? [];
      activityCompletionList.add(activityID);
      prefs.setStringList(
          PrefUtils.activity_completion, activityCompletionList);
    });
  }

  //Resets an activity's completion:
  void resetActivity(String activityID) {
    debugPrint("resetActivity");
    SharedPreferences.getInstance().then((prefs) {
      List<String> activityCompletionList = prefs.getStringList(
          PrefUtils.activity_completion) ?? [];
      activityCompletionList.remove(activityID);
      prefs.setStringList(
          PrefUtils.activity_completion, activityCompletionList);
    });
  }

  //Checks if a specific activity is completed:
  Future<bool> isActivityCompleted(String activityID) async {
    var prefs = await SharedPreferences.getInstance();
    List<String> activityCompletionList =
        prefs.getStringList(PrefUtils.activity_completion) ?? [];
    return activityCompletionList.contains(activityID);
  }

  //Gets how many activities have been completed in this challenge
  Future<int> getNumOfCompletedActivities() async {
    //Count completed activities
    int completedActivities = 0;

    for (var activityID in activityIDs) {
      bool activityCompleted = await isActivityCompleted(activityID);
      if (activityCompleted) {
        completedActivities++;
      }
    }
    return completedActivities;
  }

  //Checks if all activities are completed.
  Future<bool> isCompleted() async {
    return (await getNumOfCompletedActivities()) >= activityIDs.length;
  }

  //Unlocks a challenge
  Future<void> unlock() async {
    unlocked = true;
    var prefs = await SharedPreferences.getInstance();
    List<String> unlockedChallenges = prefs.getStringList(PrefUtils.unlocked_challenges) ?? [];
    unlockedChallenges.add(id);
    prefs.setStringList(PrefUtils.unlocked_challenges, unlockedChallenges);
  }

}