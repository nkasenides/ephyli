import 'package:ephyli/model/challenge.dart';
import 'package:ephyli/screen/activity/activity_c1a1.dart';
import 'package:ephyli/screen/activity/activity_c1a2.dart';
import 'package:ephyli/screen/activity/activity_c2a1.dart';
import 'package:ephyli/screen/activity/activity_c2a2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/activity.dart';
import '../utils/pref_utils.dart';

class ActivityManager {

  static Future<void> navigateToActivity(BuildContext context, String challengeID, String activityID, void Function(void Function()) setState) async {
    var challenge = Challenge.findChallenge(challengeID);
    var activity = Challenge.findActivity(activityID);

    if (challenge == null || activity == null) {
      throw Exception("Challenge or activity to start was not found (c: $challengeID, a: $activityID");
    }

    //Check if challenge & activity are not completed
    // var prefs = await SharedPreferences.getInstance();
    // var completedActivities = prefs.getStringList(PrefUtils.activity_completion) ?? [];
    // if (completedActivities.contains(activityID)) {
    //   throw Exception("The activity has already been finished (a: $activityID)");
    // }

    // Navigate to the appropriate activity screen
    if (context.mounted) {
      switch (activityID) {
        case "c1a1":
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ActivityC1a1(),)).then((value) {
            setState(() {});
          },);
          break;
        case "c1a2":
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ActivityC1a2(),)).then((value) {
            setState(() {});
          },);
          break;
        case "c2a1":
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ActivityC2A1(),)).then((value) {
            setState(() {});
          },);
          break;
        case "c2a2":
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ActivityC2A2(),)).then((value) {
            setState(() {});
          },);
          break;
        default:
          throw Exception("Cannot navigate to activity. No widget match for activity ID $activityID.");
      }
    }
  }

  static Future<void> completeActivity(String activityID) async {
    var prefs = await SharedPreferences.getInstance();
    List<String>? completedActivityIDs = prefs.getStringList(PrefUtils.activity_completion) ?? [];
    completedActivityIDs.add(activityID);
    prefs.setStringList(PrefUtils.activity_completion, completedActivityIDs);
  }

  static Future<void> resetActivity(String activityID) async {
    var prefs = await SharedPreferences.getInstance();
    List<String>? completedActivityIDs = prefs.getStringList(PrefUtils.activity_completion) ?? [];
    completedActivityIDs.remove(activityID);
    prefs.setStringList(PrefUtils.activity_completion, completedActivityIDs);
  }

}