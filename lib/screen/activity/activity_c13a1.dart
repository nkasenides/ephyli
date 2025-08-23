import 'dart:async';

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

class ActivityC13A1 extends StatefulWidget {
  @override
  _ActivityC13A1State createState() => _ActivityC13A1State();
}

enum C13A1Stage {
  introduction1,
  introduction2,
  introduction3,
  activity,
  finish
}

class _ActivityC13A1State extends State<ActivityC13A1> {


  C13A1Stage stage = C13A1Stage.introduction1;
  final String activityID = "c13a1";
  late Activity activity;
  late SharedPreferences prefs;
  late Future<void> future;

  /**activity data**/
  int currentStage = 0;
  int lives = 20;
  Set<String> selectedAnswers = {}; // Track selected answers

  // List of stages with questions, correct and wrong answers
  List<Map<String, dynamic>> stages = [];

  initializeStages() {
    stages = [
      {
        "title": AppLocalizations.of(context)!.c13_1_title,
        "question": AppLocalizations.of(context)!.c13_1_question,
        "correct": [
          AppLocalizations.of(context)!.c13_1_correct_1,
          AppLocalizations.of(context)!.c13_1_correct_2,
          AppLocalizations.of(context)!.c13_1_correct_3,
        ],
        "wrong": [
          AppLocalizations.of(context)!.c13_1_wrong_1,
          AppLocalizations.of(context)!.c13_1_wrong_2,
          AppLocalizations.of(context)!.c13_1_wrong_3,
          AppLocalizations.of(context)!.c13_1_wrong_4,
          AppLocalizations.of(context)!.c13_1_wrong_5,
          AppLocalizations.of(context)!.c13_1_wrong_6,
        ]
      },
      {
        "title": AppLocalizations.of(context)!.c13_2_title,
        "question": AppLocalizations.of(context)!.c13_2_question,
        "correct": [
          AppLocalizations.of(context)!.c13_2_correct_1,
          AppLocalizations.of(context)!.c13_2_correct_2,
          AppLocalizations.of(context)!.c13_2_correct_3,
          AppLocalizations.of(context)!.c13_2_correct_4,
        ],
        "wrong": [
          AppLocalizations.of(context)!.c13_2_wrong_1,
          AppLocalizations.of(context)!.c13_2_wrong_2,
          AppLocalizations.of(context)!.c13_2_wrong_3,
          AppLocalizations.of(context)!.c13_2_wrong_4,
          AppLocalizations.of(context)!.c13_2_wrong_5,
          AppLocalizations.of(context)!.c13_2_wrong_6,
          AppLocalizations.of(context)!.c13_2_wrong_7,
        ]
      },
      {
        "title": AppLocalizations.of(context)!.c13_3_title,
        "question": AppLocalizations.of(context)!.c13_3_question,
        "correct": [
          AppLocalizations.of(context)!.c13_3_correct_1,
        ],
        "wrong": [
          AppLocalizations.of(context)!.c13_3_wrong_1,
          AppLocalizations.of(context)!.c13_3_wrong_2,
          AppLocalizations.of(context)!.c13_3_wrong_3,
        ]
      },
      {
        "title": AppLocalizations.of(context)!.c13_4_title,
        "question": AppLocalizations.of(context)!.c13_4_question,
        "correct": [
          AppLocalizations.of(context)!.c13_4_correct_1,
        ],
        "wrong": [
          AppLocalizations.of(context)!.c13_4_wrong_1,
          AppLocalizations.of(context)!.c13_4_wrong_2,
        ]
      },
      {
        "title": AppLocalizations.of(context)!.c13_5_title,
        "question": AppLocalizations.of(context)!.c13_5_question,
        "correct": [
          AppLocalizations.of(context)!.c13_5_correct_1,
        ],
        "wrong": [
          AppLocalizations.of(context)!.c13_5_wrong_1,
          AppLocalizations.of(context)!.c13_5_wrong_2,
        ]
      },
      {
        "title": AppLocalizations.of(context)!.c13_6_title,
        "question": AppLocalizations.of(context)!.c13_6_question,
        "correct": [
          AppLocalizations.of(context)!.c13_6_correct_1,
          AppLocalizations.of(context)!.c13_6_correct_2,
        ],
        "wrong": [
          AppLocalizations.of(context)!.c13_6_wrong_1,
          AppLocalizations.of(context)!.c13_6_wrong_2,
          AppLocalizations.of(context)!.c13_6_wrong_3,
          AppLocalizations.of(context)!.c13_6_wrong_4,
        ]
      },
      {
        "title": AppLocalizations.of(context)!.c13_7_title,
        "question": AppLocalizations.of(context)!.c13_7_question,
        "correct": [
          AppLocalizations.of(context)!.c13_7_correct_1,
          AppLocalizations.of(context)!.c13_7_correct_2,
          AppLocalizations.of(context)!.c13_7_correct_3,
        ],
        "wrong": [
          AppLocalizations.of(context)!.c13_7_wrong_1,
          AppLocalizations.of(context)!.c13_7_wrong_2,
          AppLocalizations.of(context)!.c13_7_wrong_3,
        ]
      },
      {
        "title": AppLocalizations.of(context)!.c13_8_title,
        "question": AppLocalizations.of(context)!.c13_8_question,
        "correct": [
          AppLocalizations.of(context)!.c13_8_correct_1,
        ],
        "wrong": [
          AppLocalizations.of(context)!.c13_8_wrong_1,
          AppLocalizations.of(context)!.c13_8_wrong_2,
        ]
      },
    ];
  }

  void handleSubmit() {
    final currentStageData = stages[currentStage];
    List<String> correctAnswers = currentStageData["correct"];
    int incorrectSelections = selectedAnswers.difference(correctAnswers.toSet()).length;
    bool hasCorrectSelection = selectedAnswers.intersection(correctAnswers.toSet()).isNotEmpty;

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
            stage = C13A1Stage.finish;
          });
        }
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

  Widget activityIntroView1() {
    return InstructionsWidget(
        key: const Key("c13a1_intro1"),
        prefs,
        AppLocalizations.of(context)!.c13a1_intro1,
        AppLocalizations.of(context)!.ready_letsgo,
            () {
          setState(() {
            stage = C13A1Stage.introduction2;
          });
        }
    );
  }

  Widget activityIntroView2() {
    return InstructionsWidget(
        key: const Key("c13a1_intro2"),
        prefs,
        AppLocalizations.of(context)!.c13a1_intro2,
        AppLocalizations.of(context)!.proceed,
            () {
          setState(() {
            stage = C13A1Stage.introduction3;
          });
        }
    );
  }

  Widget activityIntroView3() {
    return InstructionsWidget(
        key: const Key("c13a1_intro3"),
        prefs,
        AppLocalizations.of(context)!.c13a1_intro3,
        AppLocalizations.of(context)!.proceed,
            () {
          setState(() {
            stage = C13A1Stage.activity;
          });
        }
    );
  }

  Widget activityGameView() {

    initializeStages();

    final currentStageData = stages[currentStage];
    List<String> answerChoices = [...currentStageData["correct"], ...currentStageData["wrong"]];
    answerChoices.sort((a, b) => a.compareTo(b),); // Randomize answer order

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
              bool isSelected = selectedAnswers.contains(answer);
              return GestureDetector(
                onTap: () {
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
                    color: isSelected ? Themes.primaryColor : Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text(
                    answer,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              );
            }),

            const SizedBox(height: 20),

            // Submit Button
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
            AppLocalizations.of(context)!.c13a1_finish,
            AppLocalizations.of(context)!.finish,
                () {
              //Save the remaining lives:
              prefs.setInt(PrefUtils.remaining_lives_c13, lives);

              ActivityManager.completeActivity(activityID).then((value) {
                Navigator.pop(context, "_");
              },);
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
      appBar: AppBar(title: Text(I10N.getI10nString("c13a1_name")!, style: const TextStyle(color: Colors.white),),
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
      case C13A1Stage.activity:
        return activityGameView();
      case C13A1Stage.finish:
        return activityFinishView();
      case C13A1Stage.introduction1:
        return activityIntroView1();
      case C13A1Stage.introduction2:
        return activityIntroView2();
      case C13A1Stage.introduction3:
        return activityIntroView3();
    }
  }

}