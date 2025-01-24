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

class ActivityC11A1 extends StatefulWidget {
  @override
  _ActivityC11A1State createState() => _ActivityC11A1State();
}

enum C11A1Stage {
  introduction,
  activity,
  finish
}

class _ActivityC11A1State extends State<ActivityC11A1> {


  C11A1Stage stage = C11A1Stage.introduction;
  final String activityID = "c11a1";
  late Activity activity;
  late SharedPreferences prefs;
  late Future<void> future;

  /**activity data**/

  List<List<bool>> stages = [
    List.filled(7, false, growable: false),
    List.filled(7, false, growable: false),
    List.filled(7, false, growable: false),
    List.filled(7, false, growable: false),
    List.filled(7, false, growable: false),
  ];

  int currentBrick = 0; // Track the current step
  int currentFloor = 0;

  int mistakes = 0; // Track mistakes

  // Define the steps with their correct and wrong answers
  List<Map<String, String>> floor0_steps = [];
  List<Map<String, String>> floor1_steps = [];
  List<Map<String, String>> floor2_steps = [];
  List<Map<String, String>> floor3_steps = [];
  List<Map<String, String>> floor4_steps = [];

  List<List<Map<String, String>>> allFloors = [];

  List<String> models = [];
  List<String> environments = [];
  List<String> statements = [];

  fillBrick(int floor, int brick) {
    floor = 4 - floor;
    setState(() {
      stages[floor][brick] = true;
    });
  }

  fillAll() {
    stages = [
      List.filled(7, true, growable: false),
      List.filled(7, true, growable: false),
      List.filled(7, true, growable: false),
      List.filled(7, true, growable: false),
      List.filled(7, true, growable: false),
    ];
  }

  reset() {
    stages = [
      List.filled(7, false, growable: false),
      List.filled(7, false, growable: false),
      List.filled(7, false, growable: false),
      List.filled(7, false, growable: false),
      List.filled(7, false, growable: false),
    ];
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
        AppLocalizations.of(context)!.c11a1_instructions,
        AppLocalizations.of(context)!.ready_letsgo,
        () {
          setState(() {
            stage = C11A1Stage.activity;
          });
        }
    );
  }

  void handleAnswer(bool isCorrect) {
    if (!isCorrect) {
      UIUtils.showFeedbackBar(context, false);
      mistakes++;
      if (mistakes >= 2) {
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.gameOver),
            content: Text(AppLocalizations.of(context)!.c11_mistakes_reached),
            actions: [
              OutlinedButton(
                child: Text(AppLocalizations.of(context)!.ok),
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    resetGame();
                  });
                },
              )
            ],
          );
        }, barrierDismissible: false);
      }
      setState(() {});
    }
    else {
      UIUtils.showFeedbackBar(context, true);
      fillBrick(currentFloor, currentBrick);
    }

    currentBrick++;
    if (currentBrick >= stages[currentFloor].length) { //move to next floor
      currentBrick = 0;
      currentFloor++;
      if (currentFloor >= stages.length) { //if last floor, end the game.
        setState(() {
          stage = C11A1Stage.finish;
        });
      }
    }
  }

  void resetGame() {
    setState(() {
      currentBrick = 0;
      currentFloor = 0;
      mistakes = 0;
      reset();
    });
  }

  void resetFloor() {
    setState(() {
      currentBrick = 0;
      mistakes = 0;
      for (int i = 0; i < stages[currentFloor].length; i++) {
        stages[currentFloor][i] = false;
      }
    });
  }

  void initializeInstructions() {
    floor0_steps = [
      {
        "instruction": AppLocalizations.of(context)!.c11_floor0_step1_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor0_step1_correct,
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor0_step2_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor0_step2_wrong
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor0_step3_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor0_step3_wrong
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor0_step4_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor0_step4_wrong,
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor0_step5_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor0_step5_wrong,
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor0_step6_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor0_step6_wrong
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor0_step7_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor0_step7_wrong
      },
    ];

    floor1_steps = [
      {
        "instruction": AppLocalizations.of(context)!.c11_floor1_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor1_step1_correct,
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor1_step2_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor1_step2_wrong
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor1_step3_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor1_step3_wrong
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor1_step4_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor1_step4_wrong,
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor1_step5_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor1_step5_wrong,
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor1_step6_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor1_step6_wrong
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor1_step7_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor1_step7_wrong
      },
    ];

    floor2_steps = [
      {
        "instruction": AppLocalizations.of(context)!.c11_floor2_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor2_step1_correct,
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor2_step2_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor2_step2_wrong
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor2_step3_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor2_step3_wrong
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor2_step4_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor2_step4_wrong,
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor2_step5_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor2_step5_wrong,
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor2_step6_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor2_step6_wrong
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor2_step7_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor2_step7_wrong
      },
    ];

    floor3_steps = [
      {
        "instruction": AppLocalizations.of(context)!.c11_floor3_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor3_step1_correct,
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor3_step2_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor3_step2_wrong
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor3_step3_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor3_step3_wrong
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor3_step4_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor3_step4_wrong,
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor3_step5_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor3_step5_wrong,
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor3_step6_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor3_step6_wrong
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor3_step7_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor3_step7_wrong
      },
    ];

    floor4_steps = [
      {
        "instruction": AppLocalizations.of(context)!.c11_floor4_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor4_step1_correct,
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor4_step2_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor4_step2_wrong
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor4_step3_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor4_step3_wrong
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor4_step4_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor4_step4_wrong,
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor4_step5_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor4_step5_wrong,
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor4_step6_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor4_step6_wrong
      },
      {
        "instruction": AppLocalizations.of(context)!.c11_instruction,
        "correct": AppLocalizations.of(context)!.c11_floor4_step7_correct,
        "wrong": AppLocalizations.of(context)!.c11_floor4_step7_wrong
      },
    ];

    allFloors = [
      floor0_steps,
      floor1_steps,
      floor2_steps,
      floor3_steps,
      floor4_steps,
    ];

    models = [
      AppLocalizations.of(context)!.c11_floor0_model,
      AppLocalizations.of(context)!.c11_floor1_model,
      AppLocalizations.of(context)!.c11_floor2_model,
      AppLocalizations.of(context)!.c11_floor3_model,
      AppLocalizations.of(context)!.c11_floor4_model,
    ];

    statements = [
      AppLocalizations.of(context)!.c11_floor0_statement,
      AppLocalizations.of(context)!.c11_floor1_statement,
      AppLocalizations.of(context)!.c11_floor2_statement,
      AppLocalizations.of(context)!.c11_floor3_statement,
      AppLocalizations.of(context)!.c11_floor4_statement,
    ];

    environments = [
      AppLocalizations.of(context)!.c11_floor0_environment,
      AppLocalizations.of(context)!.c11_floor1_environment,
      AppLocalizations.of(context)!.c11_floor2_environment,
      AppLocalizations.of(context)!.c11_floor3_environment,
      AppLocalizations.of(context)!.c11_floor4_environment,
    ];

  }

  Widget activityGameView() {

    initializeInstructions();

    return SingleChildScrollView(
      child: Padding(
        padding: Themes.standardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              models[currentFloor],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            currentBrick == 0 ? const Gap(10) : Container(),

            currentBrick == 0 ? Text(
              statements[currentFloor]
            ) : Container(),

            TowerWidget(stages),

            const SizedBox(height: 20),
            Text(
              floor0_steps[currentBrick]["instruction"]!,
            ),

            const SizedBox(height: 20),

            ...showAnswerWidgetsRandomly(),

            const SizedBox(height: 24),

            Text(
              "${AppLocalizations.of(context)!.c11_mistakes}: $mistakes/2",
              style: const TextStyle(fontSize: 18, color: Themes.secondaryColorDark),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> showAnswerWidgetsRandomly() {
    Random random = Random();
    bool a = random.nextBool();

    String? correctAnswer = allFloors[currentFloor][currentBrick]["correct"];
    String? wrongAnswer = allFloors[currentFloor][currentBrick]["wrong"];

    if (a) {
      return [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(10)
          ),
          onPressed: () => handleAnswer(true),
          child: Text(correctAnswer!),
        ),

        const SizedBox(height: 5),

        wrongAnswer != null ? ElevatedButton( //Only show wrong if present
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(10)
          ),
          onPressed: () => handleAnswer(false),
          child: Text(wrongAnswer!),
        ) : Container() ,
      ];
    }
    return [
      wrongAnswer != null ? ElevatedButton( //Only show wrong if present
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10)
        ),
        onPressed: () => handleAnswer(false),
        child: Text(wrongAnswer),
      ) : Container() ,

      const SizedBox(height: 5),

      ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10)
        ),
        onPressed: () => handleAnswer(true),
        child: Text(correctAnswer!),
      ),
    ];
  }

  Widget activityFinishView() {
    return Text("TODO");
    // return OrientationBuilder(builder: (context, orientation) {
    //   if (orientation == Orientation.portrait) {
    //     return InstructionsWidget(
    //         prefs,
    //         AppLocalizations.of(context)!.c10a2_finish_message,
    //         AppLocalizations.of(context)!.finish,
    //             () {
    //           ActivityManager.completeActivity(activityID).then((value) {
    //             //Find all badges related to this activity and award them:
    //             for (var badgeID in Challenge.challenge10.badgeIDs) {
    //               var badge = GameBadge.findBadge(badgeID);
    //               badge!.isEarned().then((value) { //only award badge if it has not been earned yet.
    //                 if (!value) {
    //                   badge.earn(context);
    //                 }
    //               },);
    //             }
    //
    //             //Unlock next challenges:
    //             List<Future> unlockFutures = [];
    //             for (var challengeID in Challenge.challenge10.unlocksChallengesIDs) {
    //               Challenge challenge = Challenge.findChallenge(challengeID)!;
    //               challenge.isUnlocked().then((value) {
    //                 if (!value) {
    //                   unlockFutures.add(challenge.unlock());
    //                 }
    //               },);
    //             }
    //
    //             //Show toast and move back:
    //             Future.wait(unlockFutures).then((value) {
    //               if (unlockFutures.isNotEmpty) {
    //                 Fluttertoast.showToast(
    //                     msg: AppLocalizations.of(context)!
    //                         .challenges_unlocked.replaceAll(
    //                         "%1", unlockFutures.length.toString()));
    //               }
    //             },);
    //           },);
    //           Navigator.pop(context, "_");
    //           Navigator.pop(context, "_");
    //         }
    //     );
    //   }
    //   else {
    //     return Center(child: RotateDeviceWidget(Orientation.portrait),);
    //   }
    // },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(I10N.getI10nString("c11a1_name")!, style: const TextStyle(color: Colors.white),),
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
      case C11A1Stage.activity:
        return activityGameView();
      case C11A1Stage.finish:
        return activityFinishView();
      case C11A1Stage.introduction:
        return activityIntroView();
    }
  }

}
