import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../theme/app_images.dart';
import '../utils/pref_utils.dart';
import 'activity.dart';

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
    challenge3,
    challenge4,
    challenge5,
    challenge6,
    challenge7,
    challenge8,
    challenge9,
    challenge10,
  ];

  // * --------------- CHALLENGES

  static final Challenge challenge1 = Challenge(
    id: "challenge1",
    nameRes: "c1_name",
    descriptionRes: "c1_description",
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
      nameRes: "c2_name",
      descriptionRes: "c2_description",
      imageCompletedRes: AppImages.logo,
      imageIncompleteRes: AppImages.logoBlackAndWhite,
      activityIDs: [
        "c2a1",
        "c2a2"
      ],
      badgeIDs: [
        "challenge2Badge"
      ],
      unlocksChallengesIDs: [
        "challenge3"
      ]
  );

  static final Challenge challenge3 = Challenge(
      id: "challenge3",
      nameRes: "c3_name",
      descriptionRes: "c3_description",
      imageCompletedRes: AppImages.logo,
      imageIncompleteRes: AppImages.logoBlackAndWhite,
      activityIDs: [
        "c3a1",
      ],
      badgeIDs: [
        "challenge3Badge"
      ],
      unlocksChallengesIDs: [
        "challenge4"
      ]
  );

  static final Challenge challenge4 = Challenge(
      id: "challenge4",
      nameRes: "c4_name",
      descriptionRes: "c4_description",
      imageCompletedRes: AppImages.logo,
      imageIncompleteRes: AppImages.logoBlackAndWhite,
      activityIDs: [
        "c4a1",
        "c4a2",
        "c4a3",
      ],
      badgeIDs: [
        "challenge4Badge"
      ],
      unlocksChallengesIDs: [
        "challenge5"
      ]
  );

  static final Challenge challenge5 = Challenge(
      id: "challenge5",
      nameRes: "c5_name",
      descriptionRes: "c5_description",
      imageCompletedRes: AppImages.logo,
      imageIncompleteRes: AppImages.logoBlackAndWhite,
      activityIDs: [
        "c5a1"
      ],
      badgeIDs: [
        "challenge5Badge"
      ],
      unlocksChallengesIDs: [
        "challenge6"
      ]
  );

  static final Challenge challenge6 = Challenge(
      id: "challenge6",
      nameRes: "c6_name",
      descriptionRes: "c6_description",
      imageCompletedRes: AppImages.logo,
      imageIncompleteRes: AppImages.logoBlackAndWhite,
      activityIDs: [
        "c6a1"
      ],
      badgeIDs: [
        "challenge6Badge"
      ],
      unlocksChallengesIDs: [
        "challenge7"
      ]
  );

  static final Challenge challenge7 = Challenge(
      id: "challenge7",
      nameRes: "c7_name",
      descriptionRes: "c7_description",
      imageCompletedRes: AppImages.logo,
      imageIncompleteRes: AppImages.logoBlackAndWhite,
      activityIDs: [
        "c7a1"
      ],
      badgeIDs: [
        "challenge7Badge"
      ],
      unlocksChallengesIDs: [
        "challenge8"
      ]
  );

  static final Challenge challenge8 = Challenge(
      id: "challenge8",
      nameRes: "c8_name",
      descriptionRes: "c8_description",
      imageCompletedRes: AppImages.logo,
      imageIncompleteRes: AppImages.logoBlackAndWhite,
      activityIDs: [
        "c8a1"
      ],
      badgeIDs: [
        "challenge8Badge"
      ],
      unlocksChallengesIDs: [
        "challenge9"
      ]
  );

  static final Challenge challenge9 = Challenge(
      id: "challenge9",
      nameRes: "c9_name",
      descriptionRes: "c9_description",
      imageCompletedRes: AppImages.logo,
      imageIncompleteRes: AppImages.logoBlackAndWhite,
      activityIDs: [
        "c9a1",
        "c9a2",
      ],
      badgeIDs: [
        "challenge9Badge"
      ],
      unlocksChallengesIDs: [
        "challenge10"
      ],
  );

  static final Challenge challenge10 = Challenge(
    id: "challenge10",
    nameRes: "c10_name",
    descriptionRes: "c10_description",
    imageCompletedRes: AppImages.logo,
    imageIncompleteRes: AppImages.logoBlackAndWhite,
    activityIDs: [
      "c10a1",
      "c10a2",
    ],
    badgeIDs: [
      "challenge10Badge"
    ],
    unlocksChallengesIDs: [
      "challenge11"
    ],
  );

  /*---------------------------------------------------------------------------*/

  static Challenge? findChallenge(String challengeID) {
    for (Challenge c in challenges) {
      if (c.id == challengeID) {
        return c;
      }
    }
    return null;
  }

  //Finds an activity using its ID.
  static Activity? findActivity(String id) {
    Activity? activity;
    Activity.activities.forEach((key, value) {
      if (key == id) {
        activity = value;
        return;
      }
    },);
    return activity;
  }

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

  //Finds the next incomplete activity in the challenge
  Future<Activity?> findNextIncompleteActivity() async {
    var prefs = await SharedPreferences.getInstance();
    List<String> completedActivities = prefs.getStringList(PrefUtils.activity_completion) ?? [];
    for (String activityID in activityIDs) {
      if (!completedActivities.contains(activityID)) {
        return findActivity(activityID);
      }
    }
    return null;
  }

  //Checks if all activities are completed.
  Future<bool> isCompleted() async {
    return (await getNumOfCompletedActivities()) >= activityIDs.length && activityIDs.isNotEmpty;
  }

  //Unlocks a challenge
  Future<void> unlock() async {
    unlocked = true;
    var prefs = await SharedPreferences.getInstance();
    List<String> unlockedChallenges = prefs.getStringList(PrefUtils.unlocked_challenges) ?? [];
    unlockedChallenges.add(id);
    prefs.setStringList(PrefUtils.unlocked_challenges, unlockedChallenges);
  }

  //Checks if a challenge is unlocked
  Future<bool> isUnlocked() async {
    var prefs = await SharedPreferences.getInstance();
    List<String> unlockedChallenges = prefs.getStringList(PrefUtils.unlocked_challenges) ?? [];
    return unlockedChallenges.contains(id);
  }

}