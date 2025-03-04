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
import 'package:flutter/rendering.dart';
import 'package:flutter_image_map/flutter_image_map.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_zoom/widget_zoom.dart';

import '../../model/activity.dart';
import '../../model/challenge.dart';
import '../../model/game_badge.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widgets/rotate_device_widget.dart';
import '../../widgets/water_bottle_widget.dart';

class ActivityC8A1 extends StatefulWidget {
  @override
  _ActivityC8A1State createState() => _ActivityC8A1State();
}

enum C8A1Stage {
  introduction,
  activity,
  finish
}

class _ActivityC8A1State extends State<ActivityC8A1> {


  C8A1Stage stage = C8A1Stage.activity;
  final String activityID = "c8a1";
  late Activity activity;
  late SharedPreferences prefs;
  late Future<void> future;

  /**activity data**/
  // Define water levels for each bottle (0.0 to 1.0 for percentage)
  double motorSkillsLevel = 0;
  double teamworkLevel = 0;
  double enjoymentLevel = 0;

  List<String> activities = [];
  Map<String, List<String>> activityOptions = {};
  Map<String, String> correctOptions = {};
  Map<String, List<double>> optionPoints = {};
  int activityIndex = 0;
  List<String> shownOptions = [];
  int selectedOptionIndex = -1;


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

  void initActivityData(BuildContext context) {
    if (activities.isEmpty) {

      activities = [
        AppLocalizations.of(context)!.activity_balance,
        AppLocalizations.of(context)!.activity_throwing,
        AppLocalizations.of(context)!.activity_striking,
      ];

      activityOptions = {
        AppLocalizations.of(context)!.activity_balance: [
          AppLocalizations.of(context)!.activity_balance_option_1,
          AppLocalizations.of(context)!.activity_balance_option_2,
          AppLocalizations.of(context)!.activity_balance_option_3,
        ],
        AppLocalizations.of(context)!.activity_throwing: [
          AppLocalizations.of(context)!.activity_throwing_option_1,
          AppLocalizations.of(context)!.activity_throwing_option_2,
          AppLocalizations.of(context)!.activity_throwing_option_3,
        ],
        AppLocalizations.of(context)!.activity_striking: [
          AppLocalizations.of(context)!.activity_striking_option_1,
          AppLocalizations.of(context)!.activity_striking_option_2,
          AppLocalizations.of(context)!.activity_striking_option_3,
        ]
      };

      correctOptions = {
        AppLocalizations.of(context)!.activity_balance: AppLocalizations.of(context)!.activity_balance_option_1,
        AppLocalizations.of(context)!.activity_throwing: AppLocalizations.of(context)!.activity_throwing_option_1,
        AppLocalizations.of(context)!.activity_striking: AppLocalizations.of(context)!.activity_striking_option_1
      };

      optionPoints = {
        AppLocalizations.of(context)!.activity_balance_option_1: [0.5, 0.5, 0.5],
        AppLocalizations.of(context)!.activity_balance_option_2: [0.25, 0.25, 0.5],
        AppLocalizations.of(context)!.activity_balance_option_3: [0.5, 0.25, 0.25],

        AppLocalizations.of(context)!.activity_throwing_option_1: [0.75, 0.5, 0.75],
        AppLocalizations.of(context)!.activity_throwing_option_2: [0, 0.25, 0.25],
        AppLocalizations.of(context)!.activity_throwing_option_3: [0.25, 0.5, 0.75],

        AppLocalizations.of(context)!.activity_striking_option_1: [0.75, 0.5, 0.75],
        AppLocalizations.of(context)!.activity_striking_option_2: [0.25, 0.5, 0.75],
        AppLocalizations.of(context)!.activity_striking_option_3: [0.25, 0.5, 0.25],
      };

      showOptions(shuffle: true);

    }

  }

  showOptions({bool shuffle = false}) {
    shownOptions = [];
    String currentActivity = activities[activityIndex];
    shownOptions = activityOptions[currentActivity]!;
    if (shuffle) {
      shownOptions.shuffle();
    }
  }

  checkOption() {

    if (selectedOptionIndex < 0) {
      UIUtils.showFeedbackBar(context, false, text: AppLocalizations.of(context)!.c8a1_please_select_option);
      return;
    }

    final String optionSelected = shownOptions[selectedOptionIndex];
    final String currentActivity = activities[activityIndex];
    final String correctOption = correctOptions[currentActivity]!;

    if (optionSelected == correctOption) {
      UIUtils.showFeedbackBar(context, true, text: AppLocalizations.of(context)!.well_done);

      if (activityIndex < activities.length - 1) { //next activity
        setState(() {
          activityIndex++;
          motorSkillsLevel = 0;
          teamworkLevel = 0;
          enjoymentLevel = 0;
          selectedOptionIndex = -1;
          showOptions(shuffle: true);
        });
      }
      else { //Otherwise switch state to the ending
        setState(() {
          stage = C8A1Stage.finish;
        });
      }

    }
    else {
      UIUtils.showFeedbackBar(context, false, text: AppLocalizations.of(context)!.c8a1_wrong);
    }
  }

  Widget activityIntroView() {
    return InstructionsWidget(
        prefs,
        AppLocalizations.of(context)!.c8a1_instructions,
        AppLocalizations.of(context)!.ready_letsgo,
        middleWidget: Text(
          AppLocalizations.of(context)!.screen_flip_notice,
          style: const TextStyle(fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
        () {
          setState(() {
            stage = C8A1Stage.activity;
          });
        }
    );
  }

  Widget activityGameView() {

    initActivityData(context);

    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return Padding(
          padding: Themes.standardPadding,
          child: SingleChildScrollView(
            child: Column(
              children: [

                //Bottles:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Water Bottle 1
                    WaterBottleWidget(level: motorSkillsLevel),

                    // Water Bottle 2
                    WaterBottleWidget(level: teamworkLevel),

                    // Water Bottle 3
                    WaterBottleWidget(level: enjoymentLevel),
                  ],
                ),

                const Gap(20),

                //Labels:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.appropriate_motor_skills_background,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.inclusion_teamwork,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.enjoyment,
                        textAlign: TextAlign.center,
                      ),
                    ),

                  ],
                ),

                const Gap(5),

                const Divider(),

                const Gap(5),

                Text(
                  AppLocalizations.of(context)!.c8a1_prompt,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),

                const Gap(10),

                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: shownOptions.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            foregroundColor: Themes.primaryColorDark,
                            backgroundColor: selectedOptionIndex == index ? Colors.yellow.shade500 : null,
                          ),
                          child: Text(
                            shownOptions[index],
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          onPressed: () {
                            setState(() {
                              selectedOptionIndex = index;
                              //Animate the bottles:
                              final String optionSelected = shownOptions[selectedOptionIndex];
                              motorSkillsLevel = optionPoints[optionSelected]![0];
                              teamworkLevel = optionPoints[optionSelected]![1];
                              enjoymentLevel = optionPoints[optionSelected]![2];
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),

                ElevatedButton.icon(
                  onPressed: () {
                    checkOption();
                  },
                  iconAlignment: IconAlignment.end,
                  icon: const Icon(Icons.navigate_next_outlined, color: Colors.white,),
                  label: Text(AppLocalizations.of(context)!.next),
                )

              ],
            ),
          ),

        );
      }
      else {
        return Center(child: RotateDeviceWidget(Orientation.portrait),);
      }
    },);
  }

  Widget activityFinishView() {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return InstructionsWidget(
            prefs,
            AppLocalizations.of(context)!.c8a1_finish_message,
            AppLocalizations.of(context)!.finish,
                () {
              ActivityManager.completeActivity(activityID).then((value) {
                //Find all badges related to this activity and award them:
                for (var badgeID in Challenge.challenge8.badgeIDs) {
                  var badge = GameBadge.findBadge(badgeID);
                  badge!.isEarned().then((value) { //only award badge if it has not been earned yet.
                    if (!value) {
                      badge.earn(context);
                    }
                  },);
                }

                //Unlock next challenges:
                List<Future> unlockFutures = [];
                for (var challengeID in Challenge.challenge8.unlocksChallengesIDs) {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(I10N.getI10nString("c8a1_name")!, style: const TextStyle(color: Colors.white),),
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
      case C8A1Stage.activity:
        return activityGameView();
      case C8A1Stage.finish:
        return activityFinishView();
      case C8A1Stage.introduction:
        return activityIntroView();
    }
  }

}
