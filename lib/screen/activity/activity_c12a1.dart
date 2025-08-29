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
          stage = C12A1Stage.finish;
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
        "title": AppLocalizations.of(context)!.c12a1_1_title,
        "question": AppLocalizations.of(context)!.c12a1_1_question,
        "answers": [
          {"text": AppLocalizations.of(context)!.c12a1_1_answer1, "type": SmileyState.smiling}, // Correct answer
          {"text": AppLocalizations.of(context)!.c12a1_1_answer2, "type": SmileyState.neutral},
          {"text": AppLocalizations.of(context)!.c12a1_1_answer3, "type": SmileyState.angry}
        ]
      },
      {
        "title": AppLocalizations.of(context)!.c12a1_2_title,
        "question": AppLocalizations.of(context)!.c12a1_2_question,
        "answers": [
          {"text": AppLocalizations.of(context)!.c12a1_2_answer1, "type": SmileyState.smiling}, // Correct answer
          {"text": AppLocalizations.of(context)!.c12a1_2_answer2, "type": SmileyState.neutral},
          {"text": AppLocalizations.of(context)!.c12a1_2_answer3, "type": SmileyState.angry}
        ]
      },
      {
        "title": AppLocalizations.of(context)!.c12a1_3_title,
        "question": AppLocalizations.of(context)!.c12a1_3_question,
        "answers": [
          {"text": AppLocalizations.of(context)!.c12a1_3_answer1, "type": SmileyState.smiling}, // Correct answer
          {"text": AppLocalizations.of(context)!.c12a1_3_answer2, "type": SmileyState.neutral},
        ]
      },
      {
        "title": AppLocalizations.of(context)!.c12a1_4_title,
        "question": AppLocalizations.of(context)!.c12a1_4_question,
        "answers": [
          {"text": AppLocalizations.of(context)!.c12a1_4_answer1, "type": SmileyState.smiling}, // Correct answer
          {"text": AppLocalizations.of(context)!.c12a1_4_answer2, "type": SmileyState.neutral},
          {"text": AppLocalizations.of(context)!.c12a1_4_answer3, "type": SmileyState.angry}
        ]
      },
      {
        "title": AppLocalizations.of(context)!.c12a1_5_title,
        "question": AppLocalizations.of(context)!.c12a1_5_question,
        "answers": [
          {"text": AppLocalizations.of(context)!.c12a1_5_answer1, "type": SmileyState.smiling}, // Correct answer
          {"text": AppLocalizations.of(context)!.c12a1_5_answer2, "type": SmileyState.neutral},
          {"text": AppLocalizations.of(context)!.c12a1_5_answer3, "type": SmileyState.angry}
        ]
      },
      {
        "title": AppLocalizations.of(context)!.c12a1_6_title,
        "question": AppLocalizations.of(context)!.c12a1_6_question,
        "answers": [
          {"text": AppLocalizations.of(context)!.c12a1_6_answer1, "type": SmileyState.smiling}, // Correct answer
          {"text": AppLocalizations.of(context)!.c12a1_6_answer2, "type": SmileyState.neutral},
          {"text": AppLocalizations.of(context)!.c12a1_6_answer3, "type": SmileyState.angry}
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
