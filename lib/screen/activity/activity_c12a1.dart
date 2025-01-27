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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widgets/lesson_box.dart';
import '../../widgets/tower_widget.dart';

class ActivityC12A1 extends StatefulWidget {
  @override
  _ActivityC12A1State createState() => _ActivityC12A1State();
}

enum C12A1Stage {
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

class _ActivityC12A1State extends State<ActivityC12A1> {


  C12A1Stage stage = C12A1Stage.introduction;
  final String activityID = "c12a1";
  late Activity activity;
  late SharedPreferences prefs;
  late Future<void> future;

  /**activity data**/
  int currentQuestionIndex = 0; // Track the current question
  int mistakes = 0; // Track mistakes

  SmileyState smileyState = SmileyState.neutral;

  // Questions and answers
  final List<Map<String, dynamic>> questions = [
    {
      "title": "Chest pass exercise",
      "question": "Pick the correct equipment set.",
      "answers": [
        {"text": "Standard balls used in basketball sport. ", "type": SmileyState.smiling}, // Correct answer
        {"text": "Balls of different weights for male and female students.", "type": SmileyState.neutral},
        {"text": "Balls of different weights for students in wheelchairs.", "type": SmileyState.angry}
      ]
    },
    {
      "title": "Chest pass exercise (individual work)",
      "question": "Setting and rules:\nA 1-meter square on a wall, 1 meter off the floor.\nA foot-foul line 2 meters from the wall.\nStudents must throw the ball inside the square and catch the rebound. The ball must be thrown from behind the line and the rebound must be caught behind the line. The ball cannot bounce before hitting the wall. Perform the exercise 5 times.\n\nAdaptation for students in wheelchairs:",
      "answers": [
        {"text": "Not needed.", "type": SmileyState.smiling}, // Correct answer
        {"text": "The foot-foul line is 1 meter from the wall.", "type": SmileyState.neutral},
        {"text": "The square is drawn 0.5 meters off the floor.", "type": SmileyState.angry}
      ]
    },
    {
      "title": "Chest pass exercise (teamwork)",
      "question": "Setting and rules (provided):\nStudents in pairs, 2 meters apart.\nStudents must throw the ball to their teammates. The ball cannot bounce. Perform the exercise 10 times.\nTeam building:",
      "answers": [
        {"text": "Students in pairs. Each student in a wheelchair works with any classmate.", "type": SmileyState.smiling}, // Correct answer
        {"text": "Students in pairs. Students in wheelchairs are in the same group.", "type": SmileyState.neutral},
      ]
    },
    {
      "title": "Spot shot exercise",
      "question": "Setting and rules (provided):\nStudents work on a basketball field.\nStudents are divided into two groups.\nThree shooting areas (1.6 meters from the basketball hoop).\nEach team is divided into 3 subgroups, one for each shooting area. Students must perform a shot and move to another area. Each student must perform 4 shoots in each area to complete the task.\nAdaptation for students in wheelchairs:",
      "answers": [
        {"text": "Not needed.", "type": SmileyState.smiling}, // Correct answer
        {"text": "The shooting areas are 1 meter from the basketball hoop.", "type": SmileyState.neutral},
        {"text": "The students in wheelchairs can perform more shots than their teammates.", "type": SmileyState.angry}
      ]
    },
    {
      "title": "Equipment",
      "question": "",
      "answers": [
        {"text": "Basketball hoops of different heights, balls of the same weight. ", "type": SmileyState.smiling}, // Correct answer
        {"text": "Basketball hoops of the same height, and balls of different weights for male ", "type": SmileyState.neutral},
        {"text": "Basketball hoops of different heights, and balls of different weights for students in wheelchairs.", "type": SmileyState.angry}
      ]
    },
    {
      "title": "Ten-meter dribble exercise:",
      "question": "Setting and rules (provided):\nLine 10-meter long.\nSix cones on the line, 1.5 meters apart.\nStudents are divided into groups.\nThe students must dribble on the line as quickly as possible using only one hand and without hitting the cone with the ball.\nStudents must perform the exercise three times in non-consecutive turns.",
      "answers": [
        {"text": "The dribbling execution needs to be adapted: bounce one time, trap the ball in lap, push wheels.", "type": SmileyState.smiling}, // Correct answer
        {"text": "Not needed.", "type": SmileyState.neutral},
        {"text": "Three cones on the line for students in wheelchairs.", "type": SmileyState.angry}
      ]
    },


    // Add more questions here as needed
  ];

  void handleAnswer(SmileyState type) {
    setState(() {
      if (type == SmileyState.smiling) {
        smileyState = SmileyState.smiling;
        UIUtils.showFeedbackBar(context, true);
        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
          _shuffleAnswers(); // Shuffle answers for the next question
        } else {
          _showGameOverDialog(AppLocalizations.of(context)!.c12_completed);
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
        AppLocalizations.of(context)!.c12a1_instructions,
        AppLocalizations.of(context)!.ready_letsgo,
        () {
          setState(() {
            stage = C12A1Stage.activity;
          });
        }
    );
  }

  Widget activityGameView() {

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
                  currentQuestion["question"],
                  // style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  // textAlign: TextAlign.center,
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
            AppLocalizations.of(context)!.c12a1_finish,
            AppLocalizations.of(context)!.finish,
                () {
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
      appBar: AppBar(title: Text(I10N.getI10nString("c12a1_name")!, style: const TextStyle(color: Colors.white),),
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
      case C12A1Stage.activity:
        return activityGameView();
      case C12A1Stage.finish:
        return activityFinishView();
      case C12A1Stage.introduction:
        return activityIntroView();
    }
  }

}
