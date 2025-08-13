import 'dart:async';
import 'dart:math';

import 'package:ephyli/controller/activity_manager.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/i10n.dart';
import 'package:ephyli/widgets/health_bar.dart';
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

import '../../utils/pref_utils.dart';

class ActivityC13A2 extends StatefulWidget {
  @override
  _ActivityC13A2State createState() => _ActivityC13A2State();
}

enum C13A2Stage {
  introduction,
  activity,
  finish
}

class _ActivityC13A2State extends State<ActivityC13A2> {


  C13A2Stage stage = C13A2Stage.introduction;
  final String activityID = "c13a2";
  late Activity activity;
  late SharedPreferences prefs;
  late Future<void> future;

  /**activity data**/
  int currentStage = 0;
  late int lives;
  Set<String> selectedAnswers = {}; // Track selected answers
  bool showCorrect = false; // reveal mode after submit

  // List of stages with questions, correct and wrong answers
  List<Map<String, dynamic>> stages = [];

  Set<String> _correctFor(int stageIndex) =>
      (stages[stageIndex]["correct"] as List<String>).toSet();

  initializeStages() {
    stages = [
      {
        "title": AppLocalizations.of(context)!.c13_9_title,
        "question": AppLocalizations.of(context)!.c13_9_question,
        "correct": [
          AppLocalizations.of(context)!.c13_9_correct_1,
          AppLocalizations.of(context)!.c13_9_correct_2,
        ],
        "wrong": [
          AppLocalizations.of(context)!.c13_9_wrong_1,
          AppLocalizations.of(context)!.c13_9_wrong_2,
          AppLocalizations.of(context)!.c13_9_wrong_3,
          AppLocalizations.of(context)!.c13_9_wrong_4,
          AppLocalizations.of(context)!.c13_9_wrong_5,
          AppLocalizations.of(context)!.c13_9_wrong_6,
          AppLocalizations.of(context)!.c13_9_wrong_7,
          AppLocalizations.of(context)!.c13_9_wrong_8,
        ]
      },
      {
        "title": AppLocalizations.of(context)!.c13_10_title,
        "question": AppLocalizations.of(context)!.c13_10_question,
        "correct": [
          AppLocalizations.of(context)!.c13_10_correct_1,
          AppLocalizations.of(context)!.c13_10_correct_2,
        ],
        "wrong": [
          AppLocalizations.of(context)!.c13_10_wrong_1,
          AppLocalizations.of(context)!.c13_10_wrong_2,
          AppLocalizations.of(context)!.c13_10_wrong_3,
          AppLocalizations.of(context)!.c13_10_wrong_4,
          AppLocalizations.of(context)!.c13_10_wrong_5,
          AppLocalizations.of(context)!.c13_10_wrong_6,
          AppLocalizations.of(context)!.c13_10_wrong_7,
          AppLocalizations.of(context)!.c13_10_wrong_8,
          AppLocalizations.of(context)!.c13_10_wrong_9,
          AppLocalizations.of(context)!.c13_10_wrong_10,
          AppLocalizations.of(context)!.c13_10_wrong_11,
        ]
      },
      {
        "title": AppLocalizations.of(context)!.c13_11_title,
        "question": AppLocalizations.of(context)!.c13_11_question,
        "correct": [
          AppLocalizations.of(context)!.c13_11_correct_1,
          AppLocalizations.of(context)!.c13_11_correct_2,
        ],
        "wrong": [
          AppLocalizations.of(context)!.c13_11_wrong_1,
          AppLocalizations.of(context)!.c13_11_wrong_2,
          AppLocalizations.of(context)!.c13_11_wrong_3,
          AppLocalizations.of(context)!.c13_11_wrong_4,
          AppLocalizations.of(context)!.c13_11_wrong_5,
          AppLocalizations.of(context)!.c13_11_wrong_6,
          AppLocalizations.of(context)!.c13_11_wrong_7,
          AppLocalizations.of(context)!.c13_11_wrong_8,
          AppLocalizations.of(context)!.c13_11_wrong_9,
          AppLocalizations.of(context)!.c13_11_wrong_10,
        ]
      },
      {
        "title": AppLocalizations.of(context)!.c13_12_title,
        "question": AppLocalizations.of(context)!.c13_12_question,
        "correct": [
          AppLocalizations.of(context)!.c13_12_correct_1,
          AppLocalizations.of(context)!.c13_12_correct_2,
        ],
        "wrong": [
          AppLocalizations.of(context)!.c13_12_wrong_1,
          AppLocalizations.of(context)!.c13_12_wrong_2,
          AppLocalizations.of(context)!.c13_12_wrong_3,
          AppLocalizations.of(context)!.c13_12_wrong_4,
          AppLocalizations.of(context)!.c13_12_wrong_5,
          AppLocalizations.of(context)!.c13_12_wrong_6,
          AppLocalizations.of(context)!.c13_12_wrong_7,
          AppLocalizations.of(context)!.c13_12_wrong_8,
          AppLocalizations.of(context)!.c13_12_wrong_9,
          AppLocalizations.of(context)!.c13_12_wrong_10,
          AppLocalizations.of(context)!.c13_12_wrong_11,
        ]
      },
    ];
  }

  void handleSubmit() {
    final currentStageData = stages[currentStage];

    final correct = _correctFor(currentStage);

    final incorrectSelections = selectedAnswers.difference(correct).length;
    final hasCorrectSelection = selectedAnswers.intersection(correct).isNotEmpty;

    // List<String> correctAnswers = currentStageData["correct"];
    // int incorrectSelections = selectedAnswers.difference(correctAnswers.toSet()).length;
    // bool hasCorrectSelection = selectedAnswers.intersection(correctAnswers.toSet()).isNotEmpty;

    setState(() {
      if (!hasCorrectSelection) {
        lives--; // Lose 1 life for not selecting a correct answer
      }

      if (incorrectSelections == 0) {
        Fluttertoast.showToast(
          msg: AppLocalizations.of(context)!.c13a1_well_done,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      }
      else {
        Fluttertoast.showToast(
          msg: AppLocalizations.of(context)!.c13a1_mistakes.replaceAll("%1", incorrectSelections.toString()),
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
      }

      lives -= incorrectSelections; // Deduct lives for wrong answers

      if (lives <= 0) {
        _showGameOverDialog(AppLocalizations.of(context)!.c13a1_game_over);
        _restartGame();
      } else {
        if (currentStage < stages.length - 1) {
          currentStage++;
          selectedAnswers.clear(); // Clear selection for the next stage
        } else {
          setState(() {
            stage = C13A2Stage.finish;
          });
        }
      }

      // Reveal answers but do not advance yet
      showCorrect = true;

      if (lives <= 0) {
        showCorrect = false; // override reveal on game over
        _showGameOverDialog(AppLocalizations.of(context)!.c13a1_game_over);
        _restartGame();
      }

    });
  }

  void _goToNextStage() {
    setState(() {
      if (currentStage < stages.length - 1) {
        currentStage++;
        selectedAnswers.clear();
        showCorrect = false;
      } else {
        stage = C13A2Stage.finish;
      }
    });
  }

  void _restartGame() {
    setState(() {
      currentStage = 0;
      lives = 20;
      selectedAnswers.clear();
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

  Future<void> loadData() async {
    prefs = await SharedPreferences.getInstance();
    lives = prefs.getInt(PrefUtils.remaining_lives_c13) ?? 20;
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
        AppLocalizations.of(context)!.c13a2_intro,
        AppLocalizations.of(context)!.ready_letsgo,
        () {
          setState(() {
            stage = C13A2Stage.activity;
          });
        }
    );
  }

  Widget activityGameView() {
    initializeStages();

    final currentStageData = stages[currentStage];
    List<String> answerChoices = [
      ...currentStageData["correct"],
      ...currentStageData["wrong"]
    ];

    // Deterministic shuffle per stage to avoid thrash on rebuild
    answerChoices.shuffle(Random(currentStage));

    final correct = _correctFor(currentStage);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HealthBar(lives: lives),

            const Gap(20),

            // Display Question
            Text(
              "${AppLocalizations.of(context)!.c13a1_stage.replaceAll("%1", (currentStage + 1).toString())} - ${currentStageData["title"]}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              currentStageData["question"],
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            // Display Answer Choices (Selectable)
            ...answerChoices.map((answer) {
              final isSelected = selectedAnswers.contains(answer);

              Color tileColor;
              IconData? trailingIcon;

              if (showCorrect) {
                if (correct.contains(answer)) {
                  tileColor = Colors.green;
                  trailingIcon = Icons.check;
                } else if (isSelected) {
                  tileColor = Colors.red;
                  trailingIcon = Icons.close;
                } else {
                  tileColor = Colors.grey;
                }
              } else {
                tileColor = isSelected ? Themes.primaryColor : Colors.grey;
              }

              return GestureDetector(
                onTap: showCorrect
                    ? null
                    : () {
                  setState(() {
                    if (isSelected) {
                      selectedAnswers.remove(answer);
                    } else {
                      selectedAnswers.add(answer);
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: tileColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          answer,
                          style: const TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      if (trailingIcon != null)
                        Icon(trailingIcon, color: Colors.white),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 20),

            // Submit / Next Button
            if (!showCorrect)
              ElevatedButton(
                onPressed: selectedAnswers.isNotEmpty ? handleSubmit : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.orange,
                ),
                child: const Text(
                  "Submit Answers",
                  style: TextStyle(fontSize: 18),
                ),
              )
            else
              ElevatedButton.icon(
                onPressed: _goToNextStage,
                icon: const Icon(Icons.arrow_forward),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.blue,
                ),
                label: const Text(
                  "Next",
                  style: TextStyle(fontSize: 18),
                ),
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
            AppLocalizations.of(context)!.c13a2_finish,
            AppLocalizations.of(context)!.finish,
                () {
                  ActivityManager.completeActivity(activityID).then((value) {
                    //Find all badges related to this activity and award them:
                    for (var badgeID in Challenge.challenge13.badgeIDs) {
                      var badge = GameBadge.findBadge(badgeID);
                      badge!.isEarned().then((value) { //only award badge if it has not been earned yet.
                        if (!value) {
                          badge.earn(context);
                        }
                      },);
                    }

                    //Unlock next challenges:
                    List<Future> unlockFutures = [];
                    for (var challengeID in Challenge.challenge13.unlocksChallengesIDs) {
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
      appBar: AppBar(title: Text(I10N.getI10nString("c13a2_name")!, style: const TextStyle(color: Colors.white),),
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
      case C13A2Stage.activity:
        return activityGameView();
      case C13A2Stage.finish:
        return activityFinishView();
      case C13A2Stage.introduction:
        return activityIntroView();
    }
  }

}
