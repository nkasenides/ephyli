import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ephyli/controller/activity_manager.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/i10n.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:ephyli/widgets/instructions_widget.dart';
import 'package:ephyli/widgets/rotate_device_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_zoom/widget_zoom.dart';

import '../../model/activity.dart';
import '../../model/challenge.dart';
import '../../model/game_badge.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivityC10A2 extends StatefulWidget {
  @override
  _ActivityC10A2State createState() => _ActivityC10A2State();
}

enum C19A2Stage {
  introduction,
  activity,
  finish
}

class _ActivityC10A2State extends State<ActivityC10A2> {


  C19A2Stage stage = C19A2Stage.introduction;
  final String activityID = "c10a2";
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
    super.dispose();
  }

  Widget activityIntroView() {
    return InstructionsWidget(
        prefs,
        AppLocalizations.of(context)!.c9a2_intro_message, //todo
        AppLocalizations.of(context)!.ready_letsgo,
        () {
          setState(() {
            stage = C19A2Stage.activity;
          });
        }
    );
  }

  Widget activityGameView() {
    return Container();
  }

  Widget activityFinishView() {
    return InstructionsWidget(
      prefs,
      AppLocalizations.of(context)!.c9a2_finish_message, //todo
      AppLocalizations.of(context)!.finish,
      () {
        ActivityManager.completeActivity(activityID).then((value) {
          //Find all badges related to this activity and award them:
          for (var badgeID in Challenge.challenge10.badgeIDs) {
            var badge = GameBadge.findBadge(badgeID);
            badge!.isEarned().then((value) { //only award badge if it has not been earned yet.
              if (!value) {
                badge.earn(context);
              }
            },);
          }

          //Unlock next challenges:
          List<Future> unlockFutures = [];
          for (var challengeID in Challenge.challenge10.unlocksChallengesIDs) {
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
          },);
        },);
        Navigator.pop(context, "_");
        Navigator.pop(context, "_");
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(I10N.getI10nString("c10a2_name")!, style: const TextStyle(color: Colors.white),),
        backgroundColor: Themes.primaryColorDark,
        iconTheme: const IconThemeData(color: Colors.white),),
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
      case C19A2Stage.activity:
        return activityGameView();
      case C19A2Stage.finish:
        return activityFinishView();
      case C19A2Stage.introduction:
        return activityIntroView();
    }
  }

}
