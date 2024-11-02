import 'dart:async';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ephyli/controller/activity_manager.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/i10n.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:ephyli/widgets/instructions_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_map/flutter_image_map.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_zoom/widget_zoom.dart';

import '../../model/activity.dart';
import '../../model/challenge.dart';
import '../../model/game_badge.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivityC7A1 extends StatefulWidget {
  @override
  _ActivityC7A1State createState() => _ActivityC7A1State();
}

enum C7A1Stage {
  introduction,
  activity,
  finish
}

class _ActivityC7A1State extends State<ActivityC7A1> {


  C7A1Stage stage = C7A1Stage.introduction;
  final String activityID = "c7a1";
  late Activity activity;
  late SharedPreferences prefs;
  late Future<void> future;

  /**activity data**/
  // Statements and their associated levels
  List<Map<String, String>> statements = [];

  // Levels
  List<String> levels = [];

  int currentStatementIndex = 0; // Track the current statement index
  int mistakes = 0; // Track mistakes made


  Future<void> loadData() async {
    prefs = await SharedPreferences.getInstance();
    activity = Activity.activities[activityID]!;
  }

  @override
  void initState() {
    //Initialize prefs & activity data:
    future = loadData();
    statements.shuffle(Random());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget activityIntroView() {
    return InstructionsWidget(
        prefs,
        AppLocalizations.of(context)!.c7a1_welcome,
        AppLocalizations.of(context)!.ready_letsgo,
        middleWidget: Text(
          AppLocalizations.of(context)!.screen_flip_notice,
          style: const TextStyle(fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
        () {
          setState(() {
            stage = C7A1Stage.activity;
          });
        }
    );
  }

  Widget activityGameView() {

    if (statements.isEmpty) {
      statements = kDebugMode ? [
        { "text": "OPT-L1", "level": "L1" },
        { "text": "OPT2-L1", "level": "L1" },
        { "text": "OPT3-L2", "level": "L2" },
        { "text": "OPT4-L1", "level": "L1" },
      ] : [
        { "text": AppLocalizations.of(context)!.limited_motor_skills, "level": AppLocalizations.of(context)!.preliminary_level},
        { "text": AppLocalizations.of(context)!.lack_of_rules_knowledge, "level": AppLocalizations.of(context)!.preliminary_level},
        { "text": AppLocalizations.of(context)!.lack_of_motivation, "level": AppLocalizations.of(context)!.preliminary_level},
        { "text": AppLocalizations.of(context)!.lack_of_social_support, "level": AppLocalizations.of(context)!.preliminary_level},
        { "text": AppLocalizations.of(context)!.developing_motor_skills, "level": AppLocalizations.of(context)!.developer_level},
        { "text": AppLocalizations.of(context)!.basic_rules_knowledge, "level": AppLocalizations.of(context)!.developer_level},
        { "text": AppLocalizations.of(context)!.wants_to_participate, "level": AppLocalizations.of(context)!.developer_level},
        { "text": AppLocalizations.of(context)!.positive_social_support, "level": AppLocalizations.of(context)!.developer_level},
        { "text": AppLocalizations.of(context)!.adapts_to_game, "level": AppLocalizations.of(context)!.advanced_level},
        { "text": AppLocalizations.of(context)!.strategic_analysis, "level": AppLocalizations.of(context)!.advanced_level},
        { "text": AppLocalizations.of(context)!.enthusiastic_participation, "level": AppLocalizations.of(context)!.advanced_level},
        { "text": AppLocalizations.of(context)!.independent_and_socially_skilled, "level": AppLocalizations.of(context)!.advanced_level}
      ];
      statements.shuffle();
    }

    if (levels.isEmpty) {
      levels = kDebugMode ? [
        "L1",
        "L2"
      ] : [
        AppLocalizations.of(context)!.preliminary_level,
        AppLocalizations.of(context)!.developer_level,
        AppLocalizations.of(context)!.advanced_level,
      ];
    }

    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return Center(child: Text(AppLocalizations.of(context)!.pleaseTurnDevice),);
      }
      else {
        return Padding(
          padding: Themes.standardPadding,
          child: Column(
            children: [
              // Display the instruction and statement
              Text(
                AppLocalizations.of(context)!.c7a1_instruction,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  statements[currentStatementIndex]["text"]!,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),

              // Display levels as clickable buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: levels.map((level) {
                  return Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          handleLevelSelection(level);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                          backgroundColor: Themes.primaryColor,
                        ),
                        child: Text(
                          level,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              // // Display the mistakes counter
              // const SizedBox(height: 20),
              // Text(
              //   "Mistakes: $mistakes / 5",
              //   style: const TextStyle(fontSize: 16, color: Colors.red),
              // ),
            ],
          ),
        );
      }
    },);

  }

  // Handle the level selection
  void handleLevelSelection(String selectedLevel) {
    String correctLevel = statements[currentStatementIndex]["level"]!;
    if (selectedLevel == correctLevel) {
      // Correct match
      setState(() {
        currentStatementIndex++;
        UIUtils.showFeedbackBar(context, true);
        if (currentStatementIndex >= statements.length) {
          setState(() {
            stage = C7A1Stage.finish;
          });
        }
      });
    } else {
      // Incorrect match
      setState(() {
        mistakes++;
        UIUtils.showFeedbackBar(context, false);
        if (mistakes >= 5) {
          // Game over condition
          _showDialog(AppLocalizations.of(context)!.gameOver, AppLocalizations.of(context)!.c1a1_5mistakesReset);
          resetGame();
        }
      });
    }
  }

  // Reset game state
  void resetGame() {
    setState(() {
      mistakes = 0;
      currentStatementIndex = 0;
      statements.shuffle(Random());
    });
  }

  // Show win or lose dialog
  void _showDialog(String title, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: Text(AppLocalizations.of(context)!.ok),
              onPressed: () {
                Navigator.of(context).pop();
                if (title == AppLocalizations.of(context)!.gameOver) {
                  resetGame();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Widget activityFinishView() {
    return InstructionsWidget(
      prefs,
      AppLocalizations.of(context)!.c7a1_finish_message,
      AppLocalizations.of(context)!.finish,
      () {
        ActivityManager.completeActivity(activityID).then((value) {
          //Find all badges related to this activity and award them:
          for (var badgeID in Challenge.challenge7.badgeIDs) {
            var badge = GameBadge.findBadge(badgeID);
            badge!.isEarned().then((value) { //only award badge if it has not been earned yet.
              if (!value) {
                badge.earn(context);
              }
            },);
          }

          //Unlock next challenges:
          List<Future> unlockFutures = [];
          for (var challengeID in Challenge.challenge7.unlocksChallengesIDs) {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(I10N.getI10nString("c7a1_name")!, style: const TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Themes.primaryColorDark,
      ),
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
      case C7A1Stage.activity:
        return activityGameView();
      case C7A1Stage.finish:
        return activityFinishView();
      case C7A1Stage.introduction:
        return activityIntroView();
    }
  }

}
