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
import '../../l10n/app_localizations.dart';

class ActivityC9A2 extends StatefulWidget {
  @override
  _ActivityC9A2State createState() => _ActivityC9A2State();
}

enum C9A2Stage {
  introduction,
  activity,
  finish
}

class _ActivityC9A2State extends State<ActivityC9A2> {


  C9A2Stage stage = C9A2Stage.introduction;
  final String activityID = "c9a2";
  late Activity activity;
  late SharedPreferences prefs;
  late Future<void> future;

  /**activity data**/
  List<Map<String, String>> statements = [];

  int currentStatementIndex = 0; // Track the current statement

// Handle dropping a statement into a box
  void handleDrop(BuildContext context, String targetType) {
    final statement = statements[currentStatementIndex];
    if (statement["type"] == targetType) {
      // Correct drop
      UIUtils.showFeedbackBar(context, true);

      if (currentStatementIndex < statements.length - 1) { //next statement
        setState(() {
          currentStatementIndex++;
        });
      }
      else { //statements done, next stage
        setState(() {
          stage = C9A2Stage.finish;
        });
      }

    } else {
      // Incorrect drop
      UIUtils.showFeedbackBar(context, false);
    }
  }

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
        AppLocalizations.of(context)!.c9a2_intro_message,
        AppLocalizations.of(context)!.ready_letsgo,
        () {
          setState(() {
            stage = C9A2Stage.activity;
          });
        }
    );
  }

  Widget activityGameView() {

    if (statements.isEmpty) {
      statements = [
        {"text": AppLocalizations.of(context)!.c9a2_activities_balanced, "type": AppLocalizations.of(context)!.c9a2_correct},
        {"text": AppLocalizations.of(context)!.c9a2_pe_curriculum_guidelines, "type": AppLocalizations.of(context)!.c9a2_correct},
        {"text": AppLocalizations.of(context)!.c9a2_music_motor_skills, "type": AppLocalizations.of(context)!.c9a2_correct},
        {"text": AppLocalizations.of(context)!.c9a2_fitness_health_wellbeing, "type": AppLocalizations.of(context)!.c9a2_correct},
        {"text": AppLocalizations.of(context)!.c9a2_evaluate_motor_skills, "type": AppLocalizations.of(context)!.c9a2_correct},
        {"text": AppLocalizations.of(context)!.c9a2_outdoor_play, "type": AppLocalizations.of(context)!.c9a2_correct},
        {"text": AppLocalizations.of(context)!.c9a2_sports_oriented_motor_skills, "type": AppLocalizations.of(context)!.c9a2_correct},
        {"text": AppLocalizations.of(context)!.c9a2_promote_self_knowledge, "type": AppLocalizations.of(context)!.c9a2_correct},
        {"text": AppLocalizations.of(context)!.c9a2_team_spirit_socialization, "type": AppLocalizations.of(context)!.c9a2_correct},
        {"text": AppLocalizations.of(context)!.c9a2_respect_game_rules, "type": AppLocalizations.of(context)!.c9a2_correct},
        {"text": AppLocalizations.of(context)!.c9a2_inclusive_games, "type": AppLocalizations.of(context)!.c9a2_correct},
        {"text": AppLocalizations.of(context)!.c9a2_enjoyment_oriented, "type": AppLocalizations.of(context)!.c9a2_correct},
        {"text": AppLocalizations.of(context)!.c9a2_varied_teaching_strategies, "type": AppLocalizations.of(context)!.c9a2_correct},
        {"text": AppLocalizations.of(context)!.c9a2_ego_oriented, "type": AppLocalizations.of(context)!.c9a2_wrong},
        {"text": AppLocalizations.of(context)!.c9a2_one_size_fits_all, "type": AppLocalizations.of(context)!.c9a2_wrong},
        {"text": AppLocalizations.of(context)!.c9a2_summary_objectives, "type": AppLocalizations.of(context)!.c9a2_wrong},
        {"text": AppLocalizations.of(context)!.c9a2_win_at_all_costs, "type": AppLocalizations.of(context)!.c9a2_wrong},
        {"text": AppLocalizations.of(context)!.c9a2_long_queues, "type": AppLocalizations.of(context)!.c9a2_wrong},
        {"text": AppLocalizations.of(context)!.c9a2_gender_separated_activities, "type": AppLocalizations.of(context)!.c9a2_wrong},
      ];

      statements.shuffle();
    }

    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Instructions
              Text(AppLocalizations.of(context)!.c9a2_prompt,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              Column(
                children: [

                  // Target Boxes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildTargetBox(context, AppLocalizations.of(context)!.c9a2_correct),
                      buildTargetBox(context, AppLocalizations.of(context)!.c9a2_wrong),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Display the current draggable statement
                  Draggable<String>(
                    data: statements[currentStatementIndex]["text"],
                    feedback: Card(
                      color: Colors.grey.shade300,
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          statements[currentStatementIndex]["text"]!,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    childWhenDragging: Container(),
                    child: Card(
                      color: Colors.grey.shade300,
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          statements[currentStatementIndex]["text"]!,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }
      else {
        return Center(child: RotateDeviceWidget(Orientation.portrait),);
      }
    },);
  }

  // Build the target boxes for Correct and Wrong
  Widget buildTargetBox(BuildContext context, String targetType) {
    return DragTarget<String>(
      onWillAccept: (data) => true,
      onAccept: (data) {
        handleDrop(context, targetType);
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: 150,
          decoration: BoxDecoration(
            color: targetType == AppLocalizations.of(context)!.c9a2_correct ? Colors.lightGreen[100] : Colors.red[100],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black54, width: 2),
          ),
          alignment: Alignment.center,
          child: Text(
            targetType,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }

  Widget activityFinishView() {
    return InstructionsWidget(
      prefs,
      AppLocalizations.of(context)!.c9a2_finish_message,
      AppLocalizations.of(context)!.finish,
      () {
        ActivityManager.completeActivity(activityID).then((value) {
          //Find all badges related to this activity and award them:
          for (var badgeID in Challenge.challenge9.badgeIDs) {
            var badge = GameBadge.findBadge(badgeID);
            badge!.isEarned().then((value) { //only award badge if it has not been earned yet.
              if (!value) {
                badge.earn(context);
              }
            },);
          }

          //Unlock next challenges:
          List<Future> unlockFutures = [];
          for (var challengeID in Challenge.challenge9.unlocksChallengesIDs) {
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
      appBar: AppBar(title: Text(I10N.getI10nString("c9a2_name")!, style: const TextStyle(color: Colors.white),),
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
      case C9A2Stage.activity:
        return activityGameView();
      case C9A2Stage.finish:
        return activityFinishView();
      case C9A2Stage.introduction:
        return activityIntroView();
    }
  }

}
