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
import 'package:widget_zoom/widget_zoom.dart';

import '../../model/activity.dart';
import '../../model/challenge.dart';
import '../../model/game_badge.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivityC4A3 extends StatefulWidget {
  @override
  _ActivityC4A3State createState() => _ActivityC4A3State();
}

enum C4A3Stage {
  introduction,
  info,
  activity,
  finish
}

class _ActivityC4A3State extends State<ActivityC4A3> {


  C4A3Stage stage = C4A3Stage.introduction;
  final String activityID = "c4a3";
  late Activity activity;
  late SharedPreferences prefs;
  late Future<void> future;

  /**activity data**/
  // List of factors
  List<String> factors = [];

  List<String> shuffledFactors = [];

  // Variables to map the factors to
  List<String> variables = [];

  // Current index of the factor being displayed
  int currentFactorIndex = 0;

  // Correct mapping for each factor
  Map<String, String> correctMappings = {};


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
    UIUtils.portraitOrientation();
    super.dispose();
  }

  Widget activityIntroView() {
    return InstructionsWidget(
        prefs,
        AppLocalizations.of(context)!.c4a3_intro_message,
        AppLocalizations.of(context)!.ready_letsgo,
        () {
          setState(() {
            stage = C4A3Stage.info;
          });
        }
    );
  }

  Widget infoView() {
    return Padding(
      padding: Themes.standardPadding,
      child: Column(
        children: [

          InstructionsWidget(
            prefs,
            AppLocalizations.of(context)!.c4a3_info_message,
            AppLocalizations.of(context)!.next,
            () {
              setState(() {
                stage = C4A3Stage.activity;
              });
            },
            middleWidget: Column(
              children: [
                WidgetZoom(
                  heroAnimationTag: "model-img",
                  zoomWidget: Image.asset(
                    "assets/img/bauman_onion.png",
                    width: MediaQuery.of(context).size.width,
                  ),
                ),

                const Gap(20),

                Text(AppLocalizations.of(context)!.screen_flip_notice)

              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget activityGameView() {
    UIUtils.landscapeOrientation();

    if (shuffledFactors.isEmpty) {

      factors = !kDebugMode ? [
        AppLocalizations.of(context)!.motivation,
        AppLocalizations.of(context)!.beliefs,
        AppLocalizations.of(context)!.sex,
        AppLocalizations.of(context)!.self_efficacy,
        AppLocalizations.of(context)!.family,
        AppLocalizations.of(context)!.friends,
        AppLocalizations.of(context)!.cultural_norms,
        AppLocalizations.of(context)!.colleagues,
        AppLocalizations.of(context)!.schools,
        AppLocalizations.of(context)!.community_clubs,
        AppLocalizations.of(context)!.organizations,
        AppLocalizations.of(context)!.workplace,
        AppLocalizations.of(context)!.built_environment,
        AppLocalizations.of(context)!.active_opportunities,
        AppLocalizations.of(context)!.parks_recreation,
        AppLocalizations.of(context)!.natural_spaces,
        AppLocalizations.of(context)!.transport_systems,
        AppLocalizations.of(context)!.health_sector,
        AppLocalizations.of(context)!.education_school,
        AppLocalizations.of(context)!.organized_sport,
        AppLocalizations.of(context)!.national,
        AppLocalizations.of(context)!.local,
      ] : [
        "A1",
        "B1",
        "C2"
      ];

      variables = !kDebugMode ? [
        AppLocalizations.of(context)!.individual,
        AppLocalizations.of(context)!.social_environment,
        AppLocalizations.of(context)!.organizations_and_institutions,
        AppLocalizations.of(context)!.physical_environment,
        AppLocalizations.of(context)!.regional_or_national_policy,
        AppLocalizations.of(context)!.culture,
      ] : [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
      ];

      correctMappings = !kDebugMode ? {

        AppLocalizations.of(context)!.motivation: AppLocalizations.of(context)!.individual,
        AppLocalizations.of(context)!.beliefs: AppLocalizations.of(context)!.individual,
        AppLocalizations.of(context)!.sex: AppLocalizations.of(context)!.individual,
        AppLocalizations.of(context)!.self_efficacy: AppLocalizations.of(context)!.individual,

        AppLocalizations.of(context)!.family: AppLocalizations.of(context)!.social_environment,
        AppLocalizations.of(context)!.friends: AppLocalizations.of(context)!.social_environment,
        AppLocalizations.of(context)!.cultural_norms: AppLocalizations.of(context)!.social_environment,
        AppLocalizations.of(context)!.colleagues: AppLocalizations.of(context)!.social_environment
        ,
        AppLocalizations.of(context)!.schools: AppLocalizations.of(context)!.organizations_and_institutions,
        AppLocalizations.of(context)!.community_clubs: AppLocalizations.of(context)!.organizations_and_institutions,
        AppLocalizations.of(context)!.organizations: AppLocalizations.of(context)!.organizations_and_institutions,
        AppLocalizations.of(context)!.workplace: AppLocalizations.of(context)!.organizations_and_institutions,

        AppLocalizations.of(context)!.built_environment: AppLocalizations.of(context)!.physical_environment,
        AppLocalizations.of(context)!.active_opportunities: AppLocalizations.of(context)!.physical_environment,
        AppLocalizations.of(context)!.parks_recreation: AppLocalizations.of(context)!.physical_environment,
        AppLocalizations.of(context)!.natural_spaces: AppLocalizations.of(context)!.physical_environment,

        AppLocalizations.of(context)!.transport_systems: AppLocalizations.of(context)!.regional_or_national_policy,
        AppLocalizations.of(context)!.health_sector: AppLocalizations.of(context)!.regional_or_national_policy,
        AppLocalizations.of(context)!.education_school: AppLocalizations.of(context)!.regional_or_national_policy,
        AppLocalizations.of(context)!.organized_sport: AppLocalizations.of(context)!.regional_or_national_policy,

        AppLocalizations.of(context)!.national: AppLocalizations.of(context)!.culture,
        AppLocalizations.of(context)!.local: AppLocalizations.of(context)!.culture,
      } : {
        "A1": "1",
        "B1": "1",
        "C2": "2",
      };

      shuffledFactors = List.from(factors);
      shuffledFactors.shuffle();
    }

    debugPrint(shuffledFactors.toString());

    if (currentFactorIndex > shuffledFactors.length - 1) {
      return Container();
    }

    String currentFactor = shuffledFactors[currentFactorIndex];

    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Star shape layout for variables
              Positioned(
                top: screenHeight * 0.2,
                left: screenWidth * 0.1,
                child: buildVariableTarget(context, variables[0]), // Top left
              ),
              Positioned(
                top: screenHeight * 0.1,
                child: buildVariableTarget(context, variables[1]), // Top
              ),
              Positioned(
                right: screenWidth * 0.1,
                top: screenHeight * 0.2,
                child: buildVariableTarget(context, variables[2]), // Top right
              ),
              Positioned(
                bottom: screenHeight * 0.2,
                left: screenWidth * 0.1,
                child: buildVariableTarget(context, variables[3]), // Bottom left
              ),
              Positioned(
                bottom: screenHeight * 0.1,
                child: buildVariableTarget(context, variables[5]), // Bottom
              ),
              Positioned(
                bottom: screenHeight * 0.2,
                right: screenHeight * 0.1,
                child: buildVariableTarget(context, variables[4]), // Bottom right
              ),

              // Draggable factor in the center
              Positioned(
                top: screenHeight * 0.35,
                child: Draggable<String>(
                  data: currentFactor,
                  feedback: Material(
                    color: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Themes.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Text(
                        currentFactor,
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  childWhenDragging: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      currentFactor,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Themes.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                      )
                    ),
                    child: Text(
                      currentFactor,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
      else {
        return Center(child: Text("Please turn your device."));
      }
    },);

  }

  // Function to check if the factor is correctly dropped onto the variable
  void handleDrop(String factor, String variable) {
    debugPrint("-> ${correctMappings[factor]} - $variable");
    if (correctMappings[factor] == variable) {
      // Correct mapping, move to the next factor
      UIUtils.showFeedbackBar(context, true);
      setState(() {
        currentFactorIndex++;
        if (currentFactorIndex >= factors.length) {
          showDialog(context: context, builder: (context) {
            return AlertDialog(
              title: Text(AppLocalizations.of(context)!.well_done),
              actions: [
                TextButton(
                  child: Text(AppLocalizations.of(context)!.proceed),
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      stage = C4A3Stage.finish;
                    });
                  },
                ),
              ],
            );
          }, barrierDismissible: false);
        }
      });
    } else {
      // Incorrect mapping, show feedback
      UIUtils.showFeedbackBar(context, false);
    }
  }

  // Helper function to build a variable as a drag target
  Widget buildVariableTarget(BuildContext context, String variable) {
    return DragTarget<String>(
      onAccept: (data) {
        handleDrop(data, variable); // Check if factor matches the variable
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Themes.primaryColorDark,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: AutoSizeText(
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
            variable,
          ),
        );
      },
    );
  }

  Widget activityFinishView() {
    UIUtils.portraitOrientation();
    return InstructionsWidget(
      prefs,
      AppLocalizations.of(context)!.c4a3_finish_message,
      AppLocalizations.of(context)!.finish,
      () {
        ActivityManager.completeActivity(activityID).then((value) {
          //Find all badges related to this activity and award them:
          for (var badgeID in Challenge.challenge4.badgeIDs) {
            var badge = GameBadge.findBadge(badgeID);
            badge!.isEarned().then((value) { //only award badge if it has not been earned yet.
              if (!value) {
                badge.earn(context);
              }
            },);
          }

          //Unlock next challenges:
          List<Future> unlockFutures = [];
          for (var challengeID in Challenge.challenge4.unlocksChallengesIDs) {
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
            Navigator.pop(context, "_");
            Navigator.pop(context, "_");
          },);
        },);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    UIUtils.enableFullScreen();
    return Scaffold(
      appBar: AppBar(title: Text(I10N.getI10nString("c4a3_name")!)),
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
      case C4A3Stage.activity:
        return activityGameView();
      case C4A3Stage.finish:
        return activityFinishView();
      case C4A3Stage.introduction:
        return activityIntroView();
      case C4A3Stage.info:
        return infoView();
    }
  }

}
