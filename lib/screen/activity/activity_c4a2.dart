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

class ActivityC4A2 extends StatefulWidget {
  @override
  _ActivityC4A2State createState() => _ActivityC4A2State();
}

enum C4A2Stage {
  // introduction,
  activity,
  finish
}

enum Correctness {
  correct(Colors.green),
  wrong(Colors.red),
  conditionallyCorrect(Colors.orange)
  ;

  final Color color;

  const Correctness(this.color);
}

class _ActivityC4A2State extends State<ActivityC4A2> {


  C4A2Stage stage = C4A2Stage.activity;
  final String activityID = "c4a2";
  late Activity activity;
  late SharedPreferences prefs;
  late Future<void> future;

  /**activity data**/
  List<String> prompts = [];
  List<String> options = [];
  List<List<Correctness>> correctness = [];

  final Color noOptionColor = Colors.grey.shade600;

  List<Color> buttonColors = [
    Colors.grey.shade600,
    Colors.grey.shade600,
    Colors.grey.shade600,
    Colors.grey.shade600,
  ];

  int promptIndex = 0;

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
    return Container();
  }

  Widget activityGameView() {

    if (prompts.isEmpty) {
      prompts = [
        AppLocalizations.of(context)!.c4a2_term1,
        AppLocalizations.of(context)!.c4a2_term2,
        AppLocalizations.of(context)!.c4a2_term3,
        AppLocalizations.of(context)!.c4a2_term4,
        AppLocalizations.of(context)!.c4a2_term5,
        AppLocalizations.of(context)!.c4a2_term6,
      ];
    }

    if (options.isEmpty) {
      options = [
        AppLocalizations.of(context)!.c4a1_category_funny,
        AppLocalizations.of(context)!.c4a1_category_social,
        AppLocalizations.of(context)!.c4a1_category_active,
        AppLocalizations.of(context)!.c4a1_category_movements,
      ];
    }

    if (correctness.isEmpty) {
      correctness = [
        [Correctness.correct, Correctness.conditionallyCorrect, Correctness.wrong, Correctness.wrong],
        [Correctness.correct, Correctness.correct, Correctness.conditionallyCorrect, Correctness.wrong],
        [Correctness.correct, Correctness.correct, Correctness.wrong, Correctness.wrong],
        [Correctness.correct, Correctness.correct, Correctness.correct, Correctness.correct],
        [Correctness.correct, Correctness.conditionallyCorrect, Correctness.correct, Correctness.correct],
        [Correctness.correct, Correctness.correct, Correctness.correct, Correctness.correct],
      ];
    }

    return Padding(
      padding: Themes.standardPadding,
      child: Column(
        children: [

          Text(AppLocalizations.of(context)!.c4a1_instruction_message),

          const Gap(20),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Display the prompt
                Text(
                  prompts[promptIndex],
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),

                const Gap(20),

                // Display the options as buttons with color feedback
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(options.length, (optionIndex) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColors[optionIndex]
                      ),
                      onPressed: () => handleOptionSelect(promptIndex, optionIndex),
                      child: Text(
                        options[optionIndex],
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          ElevatedButton(
            child: Text(AppLocalizations.of(context)!.check_solution),
            onPressed: () {
              int correctsNotFound = 0;
              for (int i = 0; i < correctness[promptIndex].length; i++) {
                if (correctness[promptIndex][i] == Correctness.correct && buttonColors[i] != Correctness.correct.color) {
                  correctsNotFound++;
                }
              }
              debugPrint("correctsNotFound: $correctsNotFound");

              if (correctsNotFound > 0) {
                UIUtils.showFeedbackBar(context, false);
                resetRow();
              }
              else {
                if (promptIndex < prompts.length - 1) { //Show next prompt
                  UIUtils.showFeedbackBar(context, true);
                  setState(() {
                    promptIndex++;
                    buttonColors = List.filled(4, noOptionColor);
                  });
                }
                else { //No more prompts, move to finish
                  setState(() {
                    stage = C4A2Stage.finish;
                  });
                }
              }
            },
          )

        ],
      ),
    );
  }

  // Handle option selection and update the color based on correctness
  void handleOptionSelect(int promptIndex, int optionIndex) {
    setState(() {
      buttonColors[optionIndex] = correctness[promptIndex][optionIndex].color;
      if (correctness[promptIndex][optionIndex] == Correctness.wrong) {
        UIUtils.showFeedbackBar(context, false);
        Future.delayed(const Duration(milliseconds: 500), () {
          resetRow();
        },);
      }
    });
  }

  void resetRow() {
    setState(() {
      for (int i = 0; i < buttonColors.length; i++) {
        buttonColors[i] = noOptionColor;
      }
    });
  }

  Widget activityFinishView() {
    return InstructionsWidget(
      prefs,
      AppLocalizations.of(context)!.c4a1_finish_message,
      AppLocalizations.of(context)!.finish,
      () {
        ActivityManager.completeActivity(activityID).then((value) {
            Navigator.pop(context, "_");
        },);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    UIUtils.enableFullScreen();
    return Scaffold(
      appBar: AppBar(title: Text(I10N.getI10nString("c4a2_name")!)),
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
      case C4A2Stage.activity:
        return activityGameView();
      case C4A2Stage.finish:
        return activityFinishView();
    }
  }

}