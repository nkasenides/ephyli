import 'dart:async';
import 'dart:ffi';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ephyli/controller/activity_manager.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/i10n.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:ephyli/widgets/instructions_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/activity.dart';
import '../../model/challenge.dart';
import '../../model/game_badge.dart';
import '../../utils/constants.dart';
import '../../utils/pref_utils.dart';
import '../../widgets/buddy_avatar_widget.dart';
import '../../widgets/chat_bubble.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivityC4A1 extends StatefulWidget {
  @override
  _ActivityC4A1State createState() => _ActivityC4A1State();
}

enum C4A1Stage {
  introduction,
  activity,
  finish
}

class _ActivityC4A1State extends State<ActivityC4A1> {


  C4A1Stage stage = C4A1Stage.introduction;
  final String activityID = "c4a1";
  late Activity activity;
  late SharedPreferences prefs;
  late Future<void> future;

  /**activity data**/



  Future<void> loadData() async {
    prefs = await SharedPreferences.getInstance();
    activity = Activity.activities[activityID]!;
  }

  @override
  void initState() {
    //Initialize prefs & activity data:
    future = loadData();
    super.initState();
  }

  @override
  void dispose() {
    UIUtils.disableFullscreen();
    super.dispose();
  }

  Widget activityIntroView() {
    return InstructionsWidget(
        prefs,
        AppLocalizations.of(context)!.c4a1_intro_message,
        AppLocalizations.of(context)!.lets_start,
        () {
          setState(() {
            stage = C4A1Stage.activity;
          });
        }
    );
  }

  Widget activityGameView() {
    return Padding(
      padding: Themes.standardPadding,
      child: Column(
        children: [

          Text(AppLocalizations.of(context)!.c4a1_instruction_message),



        ],
      ),
    );
  }

  Widget activityFinishView() {
    return InstructionsWidget(
      prefs,
      AppLocalizations.of(context)!.c3a1_finish_message,
      AppLocalizations.of(context)!.finish,
      () {
        ActivityManager.completeActivity(activityID).then((value) async {

          //Find all badges related to this activity and award them:
          for (var badgeID in Challenge.challenge3.badgeIDs) {
            var badge = GameBadge.findBadge(badgeID);
            badge!.isEarned().then((value) { //only award badge if it has not been earned yet.
              if (!value) {
                badge.earn(context);
              }
            },);
          }

          //Unlock next challenges:
          List<Future> unlockFutures = [];
          for (var challengeID in Challenge.challenge3.unlocksChallengesIDs) {
            Challenge challenge = Challenge.findChallenge(challengeID)!;
            challenge.isUnlocked().then((value) {
              if (!value) {
                unlockFutures.add(challenge.unlock());
              }
            },);
          }

          //Show toast and move back:
          Future.wait(unlockFutures).then((value) {
            if (unlockFutures.isNotEmpty) {
              Fluttertoast.showToast(
                  msg: AppLocalizations.of(context)!
                      .challenges_unlocked.replaceAll(
                      "%1", unlockFutures.length.toString()));
            }
            Navigator.pop(context, "_");
            Navigator.pop(context, "_");
          },);

        },);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    UIUtils.enableFullScreen();
    return Scaffold(
      appBar: AppBar(title: Text(I10N.getI10nString("c3a1_name")!)),
      body: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return chooseView();
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget chooseView() {
    switch (stage) {
      case C4A1Stage.introduction:
        return activityIntroView();
      case C4A1Stage.activity:
        return activityGameView();
      case C4A1Stage.finish:
        return activityFinishView();
    }
  }

}
