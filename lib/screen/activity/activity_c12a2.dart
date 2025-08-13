import 'dart:async';
import 'dart:ffi';
import 'dart:math';

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

import '../../model/activity.dart';
import '../../model/challenge.dart';
import '../../model/game_badge.dart';
import '../../l10n/app_localizations.dart';

import '../../widgets/lesson_box.dart';
import '../../widgets/tower_widget.dart';

class ActivityC12A2 extends StatefulWidget {
  @override
  _ActivityC12A2State createState() => _ActivityC12A2State();
}

enum C12A2Stage {
  introduction,
  activity,
  finish
}

enum SmileyState {
  smiling,
  neutral,
  angry
  ;
}

class _ActivityC12A2State extends State<ActivityC12A2> {


  C12A2Stage stage = C12A2Stage.introduction;
  final String activityID = "c12a2";
  late Activity activity;
  late SharedPreferences prefs;
  late Future<void> future;

  /**activity data**/
  int currentQuestionIndex = 0; // Track the current question
  int mistakes = 0; // Track mistakes

  SmileyState smileyState = SmileyState.neutral;

  // Questions and answers
  List<Map<String, dynamic>> questions = [];

  void handleAnswer(SmileyState type) {
    setState(() {
      if (type == SmileyState.smiling) {
        smileyState = SmileyState.smiling;
        UIUtils.showFeedbackBar(context, true);
        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
          _shuffleAnswers(); // Shuffle answers for the next question
        } else {
          stage = C12A2Stage.finish;
        }
      } else {
        // Wrong answer: Increment mistakes and update smiley state
        smileyState = type;
        UIUtils.showFeedbackBar(context, false);
        mistakes++;
        if (mistakes >= 3) {
          _showGameOverDialog(AppLocalizations.of(context)!.c12_mistakes);
          _restartGame();
        }
      }
    });
  }

  initializeQuestions() {
    questions = [
      {
        "title": AppLocalizations.of(context)!.c12a2_1_title,
        "question": AppLocalizations.of(context)!.c12a2_1_question,
        "answers": [
          {"text": AppLocalizations.of(context)!.c12a2_1_answer1, "type": SmileyState.smiling}, // Correct answer
          {"text": AppLocalizations.of(context)!.c12a2_1_answer2, "type": SmileyState.neutral},
          {"text": AppLocalizations.of(context)!.c12a2_1_answer3, "type": SmileyState.angry}
        ]
      },
      {
        "title": AppLocalizations.of(context)!.c12a2_2_title,
        "question": AppLocalizations.of(context)!.c12a2_2_question,
        "answers": [
          {"text": AppLocalizations.of(context)!.c12a2_2_answer1, "type": SmileyState.smiling}, // Correct answer
          {"text": AppLocalizations.of(context)!.c12a2_2_answer2, "type": SmileyState.neutral},
          {"text": AppLocalizations.of(context)!.c12a2_2_answer3, "type": SmileyState.angry}
        ]
      },
      {
        "title": AppLocalizations.of(context)!.c12a2_3_title,
        "question": AppLocalizations.of(context)!.c12a2_3_question,
        "answers": [
          {"text": AppLocalizations.of(context)!.c12a2_3_answer1, "type": SmileyState.smiling}, // Correct answer
          {"text": AppLocalizations.of(context)!.c12a2_3_answer2, "type": SmileyState.neutral},
        ]
      },
    ];
  }

  void _shuffleAnswers() {
    final random = Random();
    questions[currentQuestionIndex]["answers"].shuffle(random);
  }

  void _restartGame() {
    setState(() {
      currentQuestionIndex = 0;
      mistakes = 0;
      smileyState = SmileyState.neutral;
      _shuffleAnswers(); // Shuffle answers for the first question
    });
  }

  void _showGameOverDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.gameOver),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _restartGame();
              },
              child: Text(AppLocalizations.of(context)!.restart),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSmileyIcon() {
    IconData icon;
    Color color;

    if (smileyState == SmileyState.smiling) {
      icon = Icons.sentiment_very_satisfied;
      color = Colors.green;
    } else if (smileyState == SmileyState.neutral) {
      icon = Icons.sentiment_neutral_rounded;
      color = Colors.orange;
    } else {
      icon = Icons.sentiment_very_dissatisfied;
      color = Colors.red;
    }

    return Icon(
      icon,
      size: 100,
      color: color,
    );
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
        AppLocalizations.of(context)!.c12a2_instructions,
        AppLocalizations.of(context)!.ready_letsgo,
        () {
          setState(() {
            stage = C12A2Stage.activity;
          });
        }
    );
  }

  Widget activityGameView() {

    initializeQuestions();

    final currentQuestion = questions[currentQuestionIndex];
    return Padding(
      padding: Themes.standardPadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Half: Question and Smiley
            Column(
              children: [
                _buildSmileyIcon(),
                const SizedBox(height: 20),
                Text(
                  currentQuestion["title"],
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  currentQuestion["question"],
                ),
                const SizedBox(height: 20),
              ],
            ),

            // Bottom Half: Answer Options
            Column(
              children: currentQuestion["answers"].map<Widget>((answer) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () => handleAnswer(answer["type"]),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      backgroundColor: Themes.primaryColor,
                    ),
                    child: Text(
                      answer["text"],
                    ),
                  ),
                );
              }).toList(),
            ),

            const Gap(20),

            // Mistakes Counter
            Text(
              "${AppLocalizations.of(context)!.c11_mistakes}: $mistakes/3",
              style: const TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget activityFinishView() {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return InstructionsWidget(
            prefs,
            AppLocalizations.of(context)!.c12a2_finish,
            AppLocalizations.of(context)!.finish,
                () {
              ActivityManager.completeActivity(activityID).then((value) {
                //Find all badges related to this activity and award them:
                for (var badgeID in Challenge.challenge12.badgeIDs) {
                  var badge = GameBadge.findBadge(badgeID);
                  badge!.isEarned().then((value) { //only award badge if it has not been earned yet.
                    if (!value) {
                      badge.earn(context);
                    }
                  },);
                }

                //Unlock next challenges:
                List<Future> unlockFutures = [];
                for (var challengeID in Challenge.challenge12.unlocksChallengesIDs) {
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
      else {
        return Center(child: RotateDeviceWidget(Orientation.portrait),);
      }
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(I10N.getI10nString("c12a2_name")!, style: const TextStyle(color: Colors.white),),
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
      case C12A2Stage.activity:
        return activityGameView();
      case C12A2Stage.finish:
        return activityFinishView();
      case C12A2Stage.introduction:
        return activityIntroView();
    }
  }

}
